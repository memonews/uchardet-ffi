# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "uchardet-ffi"
  gem.homepage = "http://github.com/jou/uchardet-ffi"
  gem.license = "MIT"
  gem.summary = %Q{FFI wrapper for uchardet}
  gem.description = %Q{uchardet wraps the C++ implementation of Mozilla's Univeral Charset detector with a C interface. This gem wraps the C wrapper in Ruby. So in essense: Yo dawg, I herd you like wrappers, so I put an wrapper in your wrapper so you can wrap while you wrap }
  gem.email = "jiayong.ou@memonews.com"
  gem.authors = ["jiayong.ou"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new do |t|
end
# require 'rdoc/task'
# Rake::RDocTask.new do |rdoc|
#   version = File.exist?('VERSION') ? File.read('VERSION') : ""
# 
#   rdoc.rdoc_dir = 'rdoc'
#   rdoc.title = "uchardet-ffi #{version}"
#   rdoc.rdoc_files.include('README*')
#   rdoc.rdoc_files.include('lib/**/*.rb')
# end
