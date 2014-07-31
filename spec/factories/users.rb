FactoryGirl.define do
  factory :user do
    first_name "Chunky"
    last_name "Bacon"
    email "chunky@bacon.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

  end
end
