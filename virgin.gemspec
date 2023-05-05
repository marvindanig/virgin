# -*- encoding: utf-8 -*-
require File.expand_path('../lib/virgin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Marvin Danig']
  gem.email         = ['marvin@bubblin.io']
  gem.description   = %q{A rails engine to serve untainted static assets.}
  gem.summary       = %q{A rails engine to serve untainted static assets.}
  gem.homepage      = 'https://github.com//virgin'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'virgin'
  gem.require_paths = ['lib']
  gem.version       = virgin::VERSION

  gem.add_dependency 'rails', '>= 7.0'

  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'rspec-expectations'
  gem.add_development_dependency 'ammeter'
  gem.add_development_dependency 'capybara'
  gem.add_development_dependency 'fakefs'
  gem.add_development_dependency 'yard'
  # gem.add_development_dependency 'redcarpet'

  #we need this for the dummy app
  gem.add_development_dependency 'sqlite3'
end
