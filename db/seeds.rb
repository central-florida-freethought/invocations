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
contact1 = Contact.create(name: "Roy A. Hicks", title: "Railroad engineer", phone: "469-525-2970", email: "RoyHicks@rhyta.com",
               street_address: "3330 Jones Street", city: "Dallas", state_code: "TX", country_code: "US", zip: "75244",
               notes: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.")
contact2 = Contact.create(name: "Bruce J. McLain", title: "Asset property manager", phone: "617-795-4266", email: "BruceJMcLain@teleworm.us",
               street_address: "407 Gerald L. Bates Drive", city: "South Boston", state_code: "MA", country_code: "US", zip: "02127",
               notes: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.")
contact3 = Contact.create(name: "Emilia B. Howard", title: "EKG technician", phone: "309-464-2307", email: "EmiliaBHoward@dayrep.com",
               street_address: "2255 Trainer Avenue", city: "North Henderson", state_code: "IL", country_code: "US", zip: "61466",
               notes: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.")
contact4 = Contact.create(name: "Joanna W. Peterson", title: "Dental medicine doctor", phone: "508-323-4884", email: "JoannaWPeterson@rhyta.com",
               street_address: "4475 C Street", city: "Marlboro", state_code: "MA", country_code: "US", zip: "01752",
               notes: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.")

puts "Cleaning up the UserMeetings table"
Locality.delete_all

puts "Seeding Localities"
locality1 = Locality.create(name: "Orlando", street_address: "400 South Orange Avenue", city: "Orlando", state_code: "FL", country_code: "US",
                           zip: "32801", volunteer_needed: "1", invocations_conducted: "1", contact: contact1 )
locality2 = Locality.create(name: "Kissimmee", street_address: "101 Church Street ", city: "Kissimmee", state_code: "FL", country_code: "US",
                            zip: "34741", volunteer_needed: "1", invocations_conducted: "1", contact: contact1 )
locality3 = Locality.create(name: "Sanford", street_address: "300 N Park Avenue", city: "Sanford", state_code: "FL", country_code: "US",
                            zip: "32771", volunteer_needed: "1", invocations_conducted: "1", contact: contact2 )
locality4 = Locality.create(name: "Winter Park", street_address: "401 South Park Avenue", city: "Winter Park", state_code: "FL", country_code: "US",
                            zip: "32789", volunteer_needed: "1", invocations_conducted: "1", contact: contact2 )
locality5 = Locality.create(name: "Oviedo", street_address: "400 Alexandria Blvd", city: "Oviedo", state_code: "FL", country_code: "US",
                            zip: "32765", volunteer_needed: "1", invocations_conducted: "1", contact: contact3 )
locality6 = Locality.create(name: "Altamonte Springs", street_address: "225 Newburyport Ave.", city: "Altamonte Springs", state_code: "FL", country_code: "US",
                            zip: "32701", volunteer_needed: "1", invocations_conducted: "1", contact: contact4 )

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


# Environment variables (ENV['...']) can be set in the file .env file.
