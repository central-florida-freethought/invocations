# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :speaker do
    name "MyString"
    honorific "MyString"
    association :organization, strategy: :build
  end
end
