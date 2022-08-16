# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name = 'webtranslateit-version_fu'
  gem.version = '1.6.2'
  gem.required_ruby_version = '>= 3.1'
  gem.authors = ['Jordan McKible']
  # rubocop:todo Layout/LineLength
  gem.description = "version_fu helps version your ActiveRecord models. It is based on Rick Olson's acts_as_versioned and is compatible with Rails 3."
  # rubocop:enable Layout/LineLength
  gem.email = ''
  gem.licenses = 'MIT'
  gem.homepage = 'https://github.com/webtranslateit/version_fu'
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
  gem.summary = 'Gemified version of the version_fu plugin.'

  gem.add_dependency 'activerecord', '>= 6.1', '< 8'
end
