# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version_fu/version'

Gem::Specification.new do |gem|
  gem.name = 'version_fu'
  gem.version = Version_fu::VERSION

  gem.required_rubygems_version = Gem::Requirement.new('>= 0') if gem.respond_to? :required_rubygems_version=
  gem.authors = ['Jordan McKible']
  gem.date = '2013-05-20'
  gem.description = "version_fu helps version your ActiveRecord models. It is based on Rick Olson's acts_as_versioned and is compatible with Rails 3."
  gem.email = ''
  gem.licenses = 'MIT'
  gem.extra_rdoc_files = [
    'README.rdoc'
  ]
  gem.files = [
    'init.rb',
    'MIT-LICENSE',
    'Rakefile',
    'README.rdoc',
    'VERSION',
    'lib/version_fu.rb',
    'lib/version_fu/version_fu.rb'
  ]
  gem.homepage = ''
  gem.rdoc_options = ['--charset=UTF-8']
  gem.require_paths = ['lib']
  gem.rubygems_version = '1.3.7'
  gem.summary = 'Gemified version of the version_fu plugin.'
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_runtime_dependency 'activerecord', '>= 4.0', '< 5.2'
  gem.add_runtime_dependency 'rails-observers', '~> 0.1.2'

  # gem.add_development_dependency 'appraisal'
  gem.add_development_dependency 'rails', '>= 4.0', '< 5.2'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-rails', '~> 3.5'
  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'factory_girl'
  gem.add_development_dependency 'factory_girl_rails'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'rubocop'
end
