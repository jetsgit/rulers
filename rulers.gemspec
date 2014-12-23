# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rulers/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jerrold Thompson"]
  gem.email         = ["jet@whidbey.com"]
  gem.description   = %q{Ruby Framework}
  gem.summary       = %q{Build a Rails-like app from the ground up}
  gem.homepage      = "https://github.com/bluehandtalking/rulers"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rulers"
  gem.require_paths = ["lib"]
  gem.version       = Rulers::VERSION
  gem.add_development_dependency "rake"
  gem.add_runtime_dependency "rack" 
  gem.add_runtime_dependency "erubis"
  gem.add_runtime_dependency "multi_json"
  gem.add_runtime_dependency "sqlite3"
  gem.add_development_dependency "rack-test"
  gem.add_development_dependency "test-unit"
end
