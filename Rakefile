require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'rubygems'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: [:spec, :rubocop]
RSpec::Core::RakeTask.new

desc 'Run RuboCop checks'
RuboCop::RakeTask.new

desc 'Default: run unit tests.'
task default: :test

desc 'Test the version_fu plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.libs << 'test/models'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end
