# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :denomination do
    name Faker::Commerce.product_name
  end
end
