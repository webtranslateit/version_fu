# version_fu

[![Ruby](https://github.com/webtranslateit/version_fu/actions/workflows/ci.yml/badge.svg)](https://github.com/webtranslateit/version_fu/actions/workflows/ci.yml)

version_fu is a ActiveRecord versioning plugin that that is based on the dirty attribute checking introduced in Rails 2.1.

## Installation

Add below to your Gemfile

  `gem 'version_fu'`

## Usage

Let's say I have a pages table:

```ruby
  class Page < ActiveRecord::Base
    # attributes: id, type, title, body, created_at, updated_at, creator_id, author_id
  end
```

I want to track any changes made.  First step will be to make a new page_versions table:

```ruby
  class CreatePageVersions < ActiveRecord::Migration
    def self.up
      create_table :page_versions do |t|
        t.integer :page_id, :version, :author_id
        t.string  :title
        t.text    :body
        t.timestamps
      end
    end

    def self.down
      drop_table :page_versions
    end
  end
```

In this case, the author_id column represents the last person to edit the page.  We want to track this attribute with every version.  However, the creator_id is the person who created the page.  The will never change, so it's not part of the versioned table.

Don't forget to add a version column to your pages table.  Have it default to 1 just to be safe (although the plugin should account for this):

```ruby
  class AddVersionToPages < ActiveRecord::Migration
    def self.up
      add_column :pages, :version, :integer, :default=>1
    end
    def self.down
      remove_column :pages, :version
    end
  end
```

Of course if you're adding this plugin to a table with existing data, you'll probably want to instantiate some initial versions to start with.

Alright, so now that the database tables are in place, we can fire up version_fu.  It's quite simple:

```
  class Page < ActiveRecord::Base
    version_fu
  end
```

That's it.


## Configuration

You can pass a few configuration options if need be.  If you stick with the defaults above, you can skip all this.

```ruby
  class Page < ActiveRecord::Base
    version_fu :class_name=>'Version', :foreign_key=>'page_id', :table_name=>'page_versions', :version_column=>'version'
  end
```

* :class_name - The name of the versioned class.  It will be a submodule of the versioning class - e.g. Page::Version

* :foreign_key - The column in the versioned table associated with the versioning class

* :table_name - The name of the versioned table

* :version_column - The name of the version column


## Extensions

Now that you've got some versions, it would be nice to use ActiveRecord associations on it.  For example, Page.first.versions.latest.author wouldn't currently work because the Page::Version class doesn't know about the author method.  The version_fu call does all you to pass a block which is executed by the versioned class.  There is just one gotcha for associations:

```ruby
  class Page < ActiveRecord::Base
    version_fu do
      belongs_to :author, :class_name=>'::Author'
    end
  end
```

Don't forget the class name, or you'll get a warning

## When to Version

By default a new version will be saved whenever a versioned column is changed.  However, you can control this at a more fine grained level.  Just override the create_new_version? method.  For example, let's say you only want to save a new version if both the page title and body changed.  Taking advantage of the dirty attribute methods, you could do something like this:

```ruby
  class Page < ActiveRecord::Base
    version_fu do
      belongs_to :author, :class_name=>'::Author'
    end
    def create_new_version?
      title_changed? && body_changed?
    end
  end
```

## Author

* version_fu was created by Jordan McKible http://jordan.mckible.com

* Available on GitHub at http://github.com/jmckible/version_fu

* Available on RubyGems.org at http://rubygems.org/gems/version_fu

* acts_as_versioned by Rick Olson http://github.com/technoweenie/acts_as_versioned/tree/master
