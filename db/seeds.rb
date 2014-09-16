# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

puts "Cleaning up the UserMeetings table"
Locality.delete_all

puts "Seeding Localities"
Locality.create(name: "Orlando", street_address: "400 South Orange Avenue", city: "Orlando", state_code: "FL", country_code: "US",
               zip: "32801", volunteer_needed: "1", invocations_conducted: "1", contact_name: Faker::Name.name, contact_title: Faker::Name.title )
Locality.create(name: "Kissimmee", street_address: "101 Church Street ", city: "Kissimmee", state_code: "FL", country_code: "US",
                zip: "34741", volunteer_needed: "1", invocations_conducted: "1", contact_name: Faker::Name.name, contact_email: Faker::Internet.email, contact_phone: Faker::PhoneNumber.phone_number )
Locality.create(name: "Sanford", street_address: "300 N Park Avenue", city: "Sanford", state_code: "FL", country_code: "US",
                zip: "32771", volunteer_needed: "1", invocations_conducted: "1", contact_phone: Faker::PhoneNumber.phone_number )
Locality.create(name: "Winter Park", street_address: "401 South Park Avenue", city: "Winter Park", state_code: "FL", country_code: "US",
                zip: "32789", volunteer_needed: "1", invocations_conducted: "1" )
Locality.create(name: "Oviedo", street_address: "400 Alexandria Blvd", city: "Oviedo", state_code: "FL", country_code: "US",
                zip: "32765", volunteer_needed: "1", invocations_conducted: "1" )
Locality.create(name: "Altamonte Springs", street_address: "225 Newburyport Ave.", city: "Altamonte Springs", state_code: "FL", country_code: "US",
                zip: "32701", volunteer_needed: "1", invocations_conducted: "1" )

Religion.create(name: 'Buddhist')
Religion.create(name: 'Catholic')
Religion.create(name: 'Hindu')
Religion.create(name: "Jehovah's Witness" )
Religion.create(name: 'Jewish')
Religion.create(name: 'Mormon')
Religion.create(name: 'Muslim')
Religion.create(name: 'None')
Religion.create(name: 'Orthodox Christian')
Religion.create(name: 'Other Religion')
Religion.create(name: 'Protestant')


# Environment variables (ENV['...']) can be set in the file .env file.
