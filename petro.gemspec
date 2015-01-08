# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'petro/version'

Gem::Specification.new do |s|
  s.platform        = Gem::Platform::RUBY
  s.name            = "petro"
  s.version         = Petro.version
  s.author          = "Robert Evans"
  s.email           = "robert@codewranglers.org"
  s.homepage        = "http://www.codewranglers.org"
  s.license         = "MIT-LICENSE"
  s.summary         = "Reads a hash, generates Rails commands that can be ran to generate rails code"

  s.files           = Dir["CHANGELOG.md", "README.md", "MIT-LICENSE", "lib/**/*"]
  s.executables     = Dir["bin/*"]
  s.require_paths   = ["lib"]
  s.requirements    << 'none'

  s.add_dependency 'activesupport',         "~> 4.2.0"
  s.add_development_dependency "rake",      "~> 10.0"
  s.add_development_dependency "minitest",  "~> 5.4"
end
