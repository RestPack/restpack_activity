# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'restpack_activity/version'

Gem::Specification.new do |spec|
  spec.name          = "restpack_activity"
  spec.version       = RestPack::Activity::VERSION
  spec.authors       = ["Gavin Joyce"]
  spec.email         = ["gavinjoyce@gmail.com"]
  spec.description   = %q{A client gem to the activity service}
  spec.summary       = %q{A client gem to the activity service}
  spec.homepage      = "https://github.com/RestPack"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "restpack_gem",  "~> 0.0.9"
  spec.add_dependency "activemodel",   "~> 4.0.0"
  spec.add_dependency "activesupport", "~> 4.0"
  spec.add_dependency "rest-client",   "~> 1.6.7"
  spec.add_dependency "yajl-ruby",     "~> 1.1.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bump"
end
