# Read about Fabricators at http://www.fabricationgem.org/

Fabricator :contact do
  name Faker::Name.name
  title Faker::Name.title
  phone Faker::PhoneNumber.phone_number
  email Faker::Internet.email
  street_address Faker::Address.street_address
  city Faker::Address.city
  state_code Faker::Address.state_abbr
  country_code 'US'
  zip Faker::Address.zip
  notes Faker::Lorem.sentence
end

