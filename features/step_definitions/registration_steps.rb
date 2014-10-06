Given(/^I am not signed in$/) do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, '/users/sign_out', {}
  ensure
    Capybara.current_driver = current_driver
  end
end

When(/^I sign up with valid credentials$/) do
  sign_up_with Faker::Name.first_name,
               Faker::Name.last_name,
               Faker::Internet.email,
               Faker::PhoneNumber.phone_number,
               'please123', 'please123'
end

When(/^I sign up with email (.*)$/) do |email|
  sign_up_with Faker::Name.first_name,
               Faker::Name.last_name,
               email,
               Faker::PhoneNumber.phone_number,
               'please123', 'please123'
end

When(/^I sign up with password "(.*?)"$/) do |password|
  sign_up_with Faker::Name.first_name,
               Faker::Name.last_name,
               Faker::Internet.email,
               Faker::PhoneNumber.phone_number,
               password, password
end

# rubocop:disable Metrics/LineLength
When(/^I sign up with the password "(.*?)" and confirmation "(.*?)"$/) do |password, confirmation|
  # rubocop:enable Metrics/LineLength
  sign_up_with Faker::Name.first_name,
               Faker::Name.last_name,
               Faker::Internet.email,
               Faker::PhoneNumber.phone_number,
               password, confirmation
end

