# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cosvon/version'

Gem::Specification.new do |spec|
  spec.name          = "CosVON"
  spec.version       = Cosvon::VERSION
  spec.authors       = ["ryonext", "okitan"]
  spec.email         = ["ryonext.s@gmail.com", "okitakunio@gmail.com"]
  spec.summary       = %q{Parse and serialize CosVon.}
  spec.description   = %q{Parse and serialize CosVon.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0.beta"
end
