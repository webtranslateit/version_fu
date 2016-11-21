ActiveRecord::Base.configurations = { 'test' => { adapter: 'sqlite3', database: ':memory:' } }
ActiveRecord::Base.establish_connection :test

class VersionFuTables < ActiveRecord::Migration
  def self.up
    create_table :authors, force: true do |t|
      t.column :version, :integer
      t.column :first_name, :string, limit: 255
      t.column :last_name, :string, limit: 255
    end

    create_table :author_versions, force: true do |t|
      t.column :author_id, :integer
      t.column :version, :integer
      t.column :first_name, :string, limit: 255
      t.column :last_name, :string, limit: 255
    end

    create_table :pages, force: true do |t|
      t.column :type, :string
      t.column :version, :integer
      t.column :title, :string, limit: 255
      t.column :body, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :creator_id, :integer
      t.column :author_id, :integer
    end

    create_table :page_versions, force: true do |t|
      t.column :page_id, :integer
      t.column :version, :integer
      t.column :title, :string, limit: 255
      t.column :body, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :author_id, :integer
    end
  end

  def self.down
    drop_table :authors
    drop_table :author_versions
    drop_table :pages
    drop_table :page_versions
  end
end

ActiveRecord::Migration.verbose = false
