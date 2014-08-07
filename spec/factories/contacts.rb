# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name "MyString"
    title "MyString"
    phone "MyString"
    email "MyString"
    street_address "MyString"
    city "MyString"
    state_code "MyString"
    country_code "MyString"
    zip "MyString"
    notes "MyText"
  end
end
