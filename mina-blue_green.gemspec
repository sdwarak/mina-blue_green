# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/blue_green/version'

Gem::Specification.new do |spec|
  spec.name          = "mina-blue_green"
  spec.version       = Mina::BlueGreen::VERSION
  spec.authors       = ["Reed Law"]
  spec.email         = ["reed@lowly.me"]

  spec.summary       = %q{Adds blue-green deployments to Mina.}
  spec.description   = %q{Adds blue-green deployments to Mina.}
  spec.homepage      = "http://reedlaw.github.io/mina-blue_green/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
