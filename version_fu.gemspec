Gem::Specification.new do |gem|
  gem.name = 'webtranslateit-version_fu'
  gem.version = '1.5.0'
  gem.required_rubygems_version = '>= 2.7'
  gem.required_ruby_version = '>= 2.7'
  gem.authors = ['Jordan McKible']
  gem.description = "version_fu helps version your ActiveRecord models. It is based on Rick Olson's acts_as_versioned and is compatible with Rails 3."
  gem.email = ''
  gem.licenses = 'MIT'
  gem.files = [
    'init.rb',
    'MIT-LICENSE',
    'Rakefile',
    'README.md',
    'lib/version_fu.rb',
    'lib/version_fu/version_fu.rb'
  ]

  gem.metadata = {
    'rubygems_mfa_required' => 'true',
    'homepage' => 'https://github.com/webtranslateit/version_fu',
    'changelog_uri' => 'https://github.com/webtranslateit/webtranslateit/blob/master/history.md',
    'documentation_uri' => 'https://github.com/webtranslateit/webtranslateit#readme',
    'homepage_uri' => 'https://webtranslateit.com',
    'source_code_uri' => 'https://github.com/webtranslateit/webtranslateit',
    'wiki_uri' => 'https://github.com/webtranslateit/webtranslateit/wiki'
  }

  gem.rdoc_options = ['--charset=UTF-8']
  gem.require_paths = ['lib']
  gem.rubygems_version = '1.3.7'
  gem.summary = 'Gemified version of the version_fu plugin.'

  gem.add_dependency 'activerecord', '>= 6.1', '< 8'

  gem.add_development_dependency 'factory_bot'
  gem.add_development_dependency 'factory_bot_rails'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-rubocop'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'rails', '>= 5.2', '< 7'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-rails', '~> 3.5'
  gem.add_development_dependency 'rubocop'
  gem.add_development_dependency 'sqlite3'
end
