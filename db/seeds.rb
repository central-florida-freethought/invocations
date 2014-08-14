# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Names generated from http://www.fakenamegenerator.com
puts "Cleaning up the UserMeetings table"
Contact.delete_all

puts "Seeding Contacts"

contact = []
4.times do |i|
  contact[i] = Contact.create(name: Faker::Name.name, title: Faker::Name.title, phone: Faker::PhoneNumber.phone_number,
                              email: Faker::Internet.email, street_address: Faker::Address.street_address,
                              city: Faker::Address.city, state_code: Faker::Address.state_abbr, country_code: "US",
                              zip: Faker::Address.zip, notes: Faker::Lorem.sentence)
end

puts "Cleaning up the UserMeetings table"
Locality.delete_all

puts "Seeding Localities"
locality1 = Locality.create(name: "Orlando", street_address: "400 South Orange Avenue", city: "Orlando", state_code: "FL", country_code: "US",
                           zip: "32801", volunteer_needed: "1", invocations_conducted: "1", contact: contact[0] )
locality2 = Locality.create(name: "Kissimmee", street_address: "101 Church Street ", city: "Kissimmee", state_code: "FL", country_code: "US",
                            zip: "34741", volunteer_needed: "1", invocations_conducted: "1", contact: contact[0] )
locality3 = Locality.create(name: "Sanford", street_address: "300 N Park Avenue", city: "Sanford", state_code: "FL", country_code: "US",
                            zip: "32771", volunteer_needed: "1", invocations_conducted: "1", contact: contact[1] )
locality4 = Locality.create(name: "Winter Park", street_address: "401 South Park Avenue", city: "Winter Park", state_code: "FL", country_code: "US",
                            zip: "32789", volunteer_needed: "1", invocations_conducted: "1", contact: contact[1] )
locality5 = Locality.create(name: "Oviedo", street_address: "400 Alexandria Blvd", city: "Oviedo", state_code: "FL", country_code: "US",
                            zip: "32765", volunteer_needed: "1", invocations_conducted: "1", contact: contact[2] )
locality6 = Locality.create(name: "Altamonte Springs", street_address: "225 Newburyport Ave.", city: "Altamonte Springs", state_code: "FL", country_code: "US",
                            zip: "32701", volunteer_needed: "1", invocations_conducted: "1", contact: contact[3] )

puts "Cleaning up the UserMeetings table"
UserMeeting.delete_all

puts "Seeding UserMeetings"
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality1)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality1)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality1)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality2)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality2)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality3)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality3)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality4)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality5)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality6)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality6)
UserMeeting.create(meeting_type: "Regular", meeting_time: "2014-01-01 00:00:00.0", invocation_conducted: "Yes",
                    pledge_before: "Immediately before", asked_to_stand: "Yes, by official/employee",
                    speaker_preached: "Yes. Said stuff...blah blah", speaker_praised: "Yes. Said stuff...blah blah",
                    user: user, locality: locality6)

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
