require 'ffi'

module Uchardet
  # FFI definitions. Venture on your own peril.
  module FFI
    extend ::FFI::Library

    ffi_lib 'uchardet'

    attach_function :new, :uchardet_new, [], :pointer
    attach_function :delete, :uchardet_delete, [:pointer], :void
    attach_function :handle_data, :uchardet_handle_data, [:pointer, :string, :size_t], :int
    attach_function :data_end, :uchardet_data_end, [:pointer], :void
    attach_function :reset, :uchardet_reset, [:pointer], :void
    attach_function :get_charset, :uchardet_get_charset, [:pointer], :string
  end
end
  
