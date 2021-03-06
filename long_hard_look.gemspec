# -*- encoding: utf-8 -*-
require File.expand_path('../lib/long_hard_look/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Stuart Blair"]
  gem.email         = ["stuart.a.blair@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "long_hard_look"
  gem.require_paths = ["lib"]
  gem.version       = LongHardLook::VERSION

	gem.add_dependency "trollop", "~>2.0"

	gem.add_development_dependency "rake"
	gem.add_development_dependency "rspec", "~>2.11"
	gem.add_development_dependency "cucumber", "~>1.2"
	gem.add_development_dependency "aruba", "~>0.5"
end
