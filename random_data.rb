## run this from rails console

100.times do
  Speaker.create(name: Faker::Name.name, religion_id: rand(1..11))
end

user = User.find(1)

status = ['pending', 'reviewed' 'approved', 'denied']
meeting_types = %w(Regular Special Other)
pledge = ['Immediately before', 'Immediately after', 'Neither', 'Unknown']
stand = ['Yes, by official/employee', 'Yes, by speaker', 'Both', 'Neither']

100.times do
  UserMeeting.create meeting_time: DateTime.now,
                     invocation_conducted: 'Yes',
                     pledge_before: pledge[rand(pledge.size)],
                     asked_to_stand: stand[rand(stand.size)],
                     speaker_preached: 'No',
                     speaker_praised: 'No',
                     concerns: Faker::Lorem.sentence,
                     locality_id: rand(1..6),
                     speaker_id: 1,
                     meeting_type: meeting_types[rand(meeting_types.size)],
                     aasm_state: status[rand(status.size)],
                     user: user
end

