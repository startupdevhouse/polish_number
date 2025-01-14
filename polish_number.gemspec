# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'polish_number/version'

Gem::Specification.new do |spec|
  spec.name          = "polish_number"
  spec.version       = PolishNumber::VERSION
  spec.authors       = ["Wojciech Piekutowski", "Wacław Łuczak"]
  spec.email         = ["wojciech@piekutowski.net"]
  spec.summary       = %q{Translates numbers to Polish words}
  spec.homepage      = "https://github.com/amberbit/polish_number"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.8'
end
