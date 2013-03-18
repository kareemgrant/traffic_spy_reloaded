# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'traffic_spy/version'

Gem::Specification.new do |gem|
  gem.name          = "traffic_spy"
  gem.version       = TrafficSpy::VERSION
  gem.authors       = ["Kareem Grant"]
  gem.email         = ["kareem@getuserwise.com"]
  gem.description   = %q{"TrafficSpy Gem"}
  gem.summary       = %q{"TrafficSpy Gem"}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.add_dependency "sinatra", "1.4.1"
  gem.add_dependency "sequel", "3.45.0"
  gem.add_dependency "pg", "0.14.1"
  gem.add_dependency "useragent", "0.4.16"
  gem.add_dependency "haml", "4.0.0"


  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
