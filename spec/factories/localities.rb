# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :locality do
    name "MyString"
    city 'Bacontown'
    country_code 'US'
    state_code 'FL'
  end
end
