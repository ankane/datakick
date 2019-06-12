require_relative "lib/datakick/version"

Gem::Specification.new do |spec|
  spec.name          = "datakick"
  spec.version       = Datakick::VERSION
  spec.summary       = "Ruby client for Datakick - the open product database"
  spec.homepage      = "https://github.com/ankane/datakick"
  spec.license       = "MIT"

  spec.author        = "Andrew Kane"
  spec.email         = "andrew@chartkick.com"

  spec.files         = Dir["*.{md,txt}", "{lib}/**/*"]
  spec.require_path  = "lib"

  spec.required_ruby_version = ">= 2.4"

  spec.add_dependency "faraday"
  spec.add_dependency "hashie"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
