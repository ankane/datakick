# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datakick/version'

Gem::Specification.new do |spec|
  spec.name          = "datakick"
  spec.version       = Datakick::VERSION
  spec.authors       = ["Andrew Kane"]
  spec.email         = ["andrew@datakick.org"]
  spec.summary       = %q{Ruby client for Datakick - the open product database}
  spec.description   = %q{Ruby client for Datakick - the open product database}
  spec.homepage      = "https://github.com/ankane/datakick-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "hashie"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
