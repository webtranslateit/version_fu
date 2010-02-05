# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nbudin-version_fu}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jordan McKible"]
  s.date = %q{2010-02-05}
  s.description = %q{version_fu is a ActveRecord versioning gem that takes advantage of the new dirty attribute checking available in Rails 2.1. Previous solutions like Rick Olson's acts_as_versioned are no long compatible with Rails.}
  s.email = %q{}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     ".idea/encodings.xml",
     ".idea/inspectionProfiles/Project_Default.xml",
     ".idea/inspectionProfiles/profiles_settings.xml",
     ".idea/misc.xml",
     ".idea/modules.xml",
     ".idea/projectCodeStyle.xml",
     ".idea/vcs.xml",
     ".idea/version_fu.iml",
     ".idea/workspace.xml",
     "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/version_fu.rb",
     "lib/version_fu/version_fu.rb",
     "nbudin-version_fu.gemspec",
     "rails/init.rb",
     "test/db/database.yml",
     "test/db/schema.rb",
     "test/fixtures/author_versions.yml",
     "test/fixtures/authors.yml",
     "test/fixtures/page_versions.yml",
     "test/fixtures/pages.yml",
     "test/models/author.rb",
     "test/models/page.rb",
     "test/test_helper.rb",
     "test/version_fu_test.rb",
     "version_fu.gemspec"
  ]
  s.homepage = %q{}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Gemified version of the version_fu plugin, tracking changes from revo and jmckible.}
  s.test_files = [
    "test/db/schema.rb",
     "test/version_fu_test.rb",
     "test/models/author.rb",
     "test/models/page.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
