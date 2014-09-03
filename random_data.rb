## run this from rails console

for i in 1..100
  Speaker.create(name: Faker::Name.name, religion_id: rand(1..11))
end

user = User.find(1)

for i in 1..100
  UserMeeting.create(meeting_time: DateTime.now, invocation_conducted: 'Yes, Explain', pledge_before: 'Immediately before', asked_to_stand: 'Yes, by official/employee', speaker_preached: 'No', speaker_praised: 'No', concerns: Faker::Lorem.sentence, locality_id: rand(1..6), speaker_id: rand(1..111), meeting_type: 'Regular', user: user )
end
