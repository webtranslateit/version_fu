require 'rails_helper'

describe Version_fu, type: :model do
  after :all do
    VersionFuTables.down
  end

  describe 'associations' do
    subject(:welcome) { create(:page) }
    before do
      welcome.update(title: 'Version 2', body: 'New Version')
      welcome.save
    end

    it 'make parent having many versions' do
      expect(welcome.versions.count).to eq(2)
    end

    it 'make version belonging to parent' do
      expect(welcome.versions[0].page).to eq(welcome)
    end
  end

  describe 'attributes' do
    subject(:columns) { Page.new.versioned_columns }

    it 'has version proper columns' do
      expect(columns).to match_array(%w(title body author_id))
    end

    it 'do not have version non-existing columns' do
      expect(columns).not_to include(:creator_id)
    end
  end

  describe 'create' do
    let(:larry) { create(:larry) }
    subject(:save_page) { create(:page, title: 'New', body: 'body', creator_id: larry.id, author_id: larry.id) }

    it 'save new version' do
      old_count = Page.count
      old_version_count = Page::Version.count
      create(:page)
      expect(Page.count).to eq(old_count + 1)
      expect(Page::Version.count).to eq(old_version_count + 1)
    end

    it 'wire up associations' do
      expect(save_page.versions.first).to eq(Page::Version.order('id desc').first)
    end

    it 'begin version numbering at 1' do
      expect(save_page.version).to eq(1)
      expect(save_page.versions.first.version).to eq(1)
    end

    it 'assign attributes' do
      version = save_page.versions.first
      expect(version.title).to eq('New')
      expect(version.body).to eq('body')
      expect(version.author).to eq(larry)
    end
  end

  describe 'update' do
    subject(:welcome) { create(:page) }
    let(:sara) { create(:sara) }

    it 'save new version' do
      page = create(:page)
      old_count = Page::Version.count
      page.update title: 'New title', body: 'new body', author_id: sara.id
      expect(Page::Version.count).to eq(old_count + 1)
    end

    it 'increment verson number' do
      old_count = welcome.version
      welcome.update title: 'New title', body: 'new body', author_id: sara.id
      expect(welcome.reload.version).to eq(old_count + 1)
    end

    it 'update version attributes' do
      welcome.update title: 'Latest', body: 'newest', author_id: sara.id
      version = welcome.reload.versions.latest
      expect(version.title).to eq('Latest')
      expect(version.body).to eq('newest')
      expect(version.author_id).to eq(sara.id)
    end
  end

  describe 'skip versioning' do
    let(:welcome) { create(:page) }
    let(:larry) { create(:larry) }
    let(:sara) { create(:sara) }

    it 'do not create new version if nothing is changed' do
      page = create(:page)
      old_count = Page::Version.count
      page.save
      expect(Page::Version.count).to eq(old_count)
    end

    it 'do not create new version if untracked attribute is changed' do
      page = create(:page)
      old_count = Page::Version.count
      page.update created_at: 1.day.ago
      expect(Page::Version.count).to eq(old_count)
    end

    it 'do not create new version if custom version is checked' do
      expect(larry.last_name).to eq('Appleton')
      old_count = Author::Version.count
      larry.update last_name: 'Lessig'
      expect(Author::Version.count).to eq(old_count)
    end

    it 'still save if no new version with custom version check' do
      expect(larry.last_name).to eq('Appleton')
      larry.update last_name: 'Lessig'
      expect(larry.reload.last_name).to eq('Lessig')
    end
  end

  describe 'finds' do
    subject(:welcome) { create(:page) }
    let(:welcome_1) { welcome.versions[0] }
    before do
      welcome.update title: 'Version 2', body: 'new version'
    end

    it 'version given number' do
      welcome_2 = welcome.versions[1]
      expect(welcome_1).not_to eq(welcome_2)
      expect(welcome.find_version(1)).to eq(welcome_1)
      expect(welcome.find_version(2)).to eq(welcome_2)
    end

    it 'latest version' do
      welcome_2 = welcome.versions[1]
      expect(welcome.versions.latest).to eq(welcome_2)
    end

    it 'previous version' do
      welcome_2 = welcome.versions[1]
      expect(welcome_2.previous).to eq(welcome_1)
    end

    it 'next version' do
      welcome_2 = welcome.versions[1]
      expect(welcome_1.next).to eq(welcome_2)
    end
  end

  describe 'block extension' do
    let(:larry) { create(:larry) }
    let(:welcome) { create(:page, author: larry) }
    subject(:welcome_1) { welcome.versions[0] }

    it 'take a block containing ActiveRecord extension' do
      expect(welcome_1.author).to eq(larry)
    end
  end
end
