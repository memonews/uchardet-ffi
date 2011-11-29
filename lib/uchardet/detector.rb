module Uchardet
  class Detector
    # Create a {Proc} for {ObjectSpace.define_finalizer}
    #
    # @return [Proc]
    def self.finalizer(uchardet_pointer)
      proc { Uchardet::FFI.delete(uchardet_pointer) }
    end

    def initialize
      @uchardet_pointer = Uchardet::FFI.new

      # Free uchardet instance in C when wrapper get garbage collected
      ObjectSpace.define_finalizer(self, self.class.finalizer(@uchardet_pointer))
    end

    # Feed data to the detector
    #
    # @param [String] data
    # @return [Boolean] whether there was an error
    def handle(data)
      data = data.to_s
      data_size = data.bytesize

      Uchardet::FFI.handle_data(@uchardet_pointer, data, data_size) == 0
    end

    # Signals the detector that it has all the data it can get.
    # {#charset} is available afterwards
    #
    # @return [nil]
    def done
      Uchardet::FFI.data_end(@uchardet_pointer)
    end

    # Reset the state of the detector so new input can be fed
    #
    # @return [nil]
    def reset
      Uchardet::FFI.reset(@uchardet_pointer)
    end

    # Detected charset. Not available until {#done} has been called
    #
    # @return [String]
    def charset
      Uchardet::FFI.get_charset(@uchardet_pointer)
    end
  end
end
