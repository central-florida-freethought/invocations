# Given /^a locality(?: with name (.*?))?$/ do |name|
#   name ||= Faker::Company.name
#   @locality = Fabricate :locality, name: name
# end

When /^I fill in the locality fields$/ do
  fill_in 'locality[name]', with: Faker::Name.name
  fill_in 'locality[phone_number]', with: Faker::PhoneNumber.phone_number
  fill_in 'locality[street_address]', with: Faker::Address.street_address
  fill_in 'locality[city]', with: Faker::Address.city
  select 'Florida', from: 'locality[state_code]'
  fill_in 'locality[zip]', with: Faker::Address.zip
  fill_in 'locality[location_notes]', with: Faker::Lorem.sentence
  fill_in 'locality[website_url]', with: Faker::Internet.url
  choose 'locality_volunteer_needed_true'
  fill_in 'locality[meeting_data_url]', with: Faker::Internet.url
  fill_in 'locality[meeting_schedule]', with: Faker::Lorem.sentence
  choose 'locality_invocations_conducted_true'
end

Then /^I should be on the locality page for (.*)$/i do |locality_name|
  locality = Locality.where(name: locality_name).first
  expect(current_path).to eq locality_path(locality)
end

Then /^I should be on the edit locality page for (.*)$/i do |locality_name|
  locality = Locality.where(name: locality_name).first
  expect(current_path).to eq edit_locality_path(locality)
end