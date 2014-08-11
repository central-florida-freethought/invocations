# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :locality do
    name Faker::Name.name
    street_address Faker::Address.street_address
    city Faker::Address.city
    country_code 'US'
    state_code Faker::Address.state_abbr
    zip Faker::Address.zip
    location_notes Faker::Lorem.sentence
    website_url Faker::Internet.url
    volunteer_needed true
    meeting_data_url Faker::Internet.url
    meeting_schedule Faker::Lorem.sentence
    invocations_conducted true
    association :contact, strategy: :build
  end
end
