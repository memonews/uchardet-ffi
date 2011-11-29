require File.dirname(__FILE__)+'/uchardet/ffi'
require File.dirname(__FILE__)+'/uchardet/detector'

module Uchardet
  # Alias for {Detector.detect}
  #
  # @return [String]
  def detect(data)
    Detector.detect(data)
  end
end
