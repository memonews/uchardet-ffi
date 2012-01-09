# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "uchardet-ffi"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["jiayong.ou"]
  s.date = "2012-01-09"
  s.description = "uchardet wraps the C++ implementation of Mozilla's Univeral Charset detector with a C interface. This gem wraps the C wrapper in Ruby. So in essense: Yo dawg, I herd you like wrappers, so I put an wrapper in your wrapper so you can wrap while you wrap "
  s.email = "jiayong.ou@memonews.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "lib/uchardet.rb",
    "lib/uchardet/detector.rb",
    "lib/uchardet/ffi.rb",
    "spec/fixtures/big5.txt",
    "spec/fixtures/gb18030.txt",
    "spec/fixtures/shift_jis.txt",
    "spec/fixtures/utf8-with-wrong-prologue.xml",
    "spec/fixtures/utf8.txt",
    "spec/fixtures/windows-1252.txt",
    "spec/spec_helper.rb",
    "spec/uchardet/detector_spec.rb",
    "uchardet-ffi.gemspec"
  ]
  s.homepage = "http://github.com/jou/uchardet-ffi"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "FFI wrapper for uchardet"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 0"])
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.7.3"])
      s.add_development_dependency(%q<rdiscount>, ["~> 1.6.8"])
    else
      s.add_dependency(%q<ffi>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.7.3"])
      s.add_dependency(%q<rdiscount>, ["~> 1.6.8"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.7.3"])
    s.add_dependency(%q<rdiscount>, ["~> 1.6.8"])
  end
end

