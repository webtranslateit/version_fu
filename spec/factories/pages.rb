FactoryGirl.define do
  factory :page do
    sequence(:id)
    type 'Page'
    version 2
    title 'Version 2'
    body 'two'
    created_at { 1.hour.ago }
    updated_at { 1.hour.ago }
    creator_id 1
    author_id 2
  end

  factory :page_version, class: Page::Version do
    page
    sequence(:version)
    title 'Page::Version'
    body 'Version Document'
    created_at { 1.hour.ago }
    updated_at { 1.hour.ago }
    author_id 1
  end
end
