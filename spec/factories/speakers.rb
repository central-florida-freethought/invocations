# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :speaker do
    name Faker::Name.name
    honorific Faker::Name.prefix
    association :organization, strategy: :build
    association :religion
    association :denomination
  end
end
