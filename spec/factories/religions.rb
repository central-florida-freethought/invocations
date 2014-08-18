# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :religion do
    name Faker::Commerce.product_name
  end
end
