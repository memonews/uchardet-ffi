require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'spec_helper')

describe Uchardet::Detector do
  describe "encoding detection" do
    # file_name => expected_encoding
    fixture_files = {
      'utf8.txt' => 'UTF-8',
      'big5.txt' => 'Big5',
      'gb18030.txt' => 'gb18030',
      'shift_jis.txt' => 'Shift_JIS',
      'windows-1252.txt' => 'windows-1252',
    }

    fixtures_dir = File.join(File.expand_path(File.dirname(__FILE__)), '..', 'fixtures')

    fixture_files.each do |file, expected_encoding|
      it "should be able to detect #{expected_encoding}" do
        content = File.read(File.join(fixtures_dir, file))

        detector = Uchardet::Detector.new
        detector.handle(content)
        detector.done

        detector.charset.should == expected_encoding
      end

      it "should be able to detect #{expected_encoding} using class method" do
        content = File.read(File.join(fixtures_dir, file))

        Uchardet::Detector.detect(content) == expected_encoding
      end
    end

    it "should be able to keep on detecting after reset" do
      detector = Uchardet::Detector.new

      fixture_files.each do |file, expected_encoding|
        content = File.read(File.join(fixtures_dir, file))

        detector.handle(content)
        detector.done

        detector.charset.should == expected_encoding

        detector.reset
      end
    end
  end

  # Matz says we don't have to worry about finalizers being called:
  # http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/87753
  #
  # So, only that the finalizer is registered and what it does is tested
  describe "C memory management:" do
    describe "constructor" do
      it "should register finalizer with ObjectSpace" do
        some_proc = :some_proc
        
        Uchardet::Detector.should_receive(:finalizer).once.and_return(some_proc)
        ObjectSpace.should_receive(:define_finalizer).once.with(an_instance_of(Uchardet::Detector), some_proc)
        detector = Uchardet::Detector.new
      end
    end

    describe "finalizer" do
      it "should free the detector's memory" do
        mock_pointer = :some_pointer
        Uchardet::FFI.should_receive(:delete).once.with(mock_pointer)

        finalizer_proc = Uchardet::Detector.finalizer(mock_pointer)
        finalizer_proc.call
      end
    end
  end
end
