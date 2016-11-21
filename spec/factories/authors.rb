FactoryGirl.define do
  factory :author do
    sequence(:version)
    first_name 'John'
    last_name 'Doe'

    factory :larry do
      first_name 'Larry'
      last_name 'Appleton'
    end

    factory :sara do
      first_name 'Sara'
      last_name 'Smiles'
    end

    factory :peter do
      first_name 'Peter'
      last_name 'Parker'
    end
  end

  factory :author_version, class: Author::Version do
    author
    sequence(:version)
    first_name 'John'
    last_name 'Doe'
  end
end
