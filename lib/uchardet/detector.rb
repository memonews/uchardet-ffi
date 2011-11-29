module Uchardet
  class Detector
    def self.finalizer(uchardet_pointer)
      proc { Uchardet::FFI.delete(uchardet_pointer) }
    end

    def initialize
      @uchardet_pointer = Uchardet::FFI.new

      # Free uchardet instance in C when wrapper get garbage collected
      ObjectSpace.define_finalizer(self, self.class.finalizer(@uchardet_pointer))
    end

    def handle(data)
      data = data.to_s
      data_size = data.bytesize

      Uchardet::FFI.handle_data(@uchardet_pointer, data, data_size)
    end

    def done
      Uchardet::FFI.data_end(@uchardet_pointer)
    end

    def reset
      Uchardet::FFI.reset(@uchardet_pointer)
    end

    def charset
      Uchardet::FFI.get_charset(@uchardet_pointer)
    end
  end
end
