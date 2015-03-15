json.report @user_meetings do |meeting|
  if meeting.religion?
    json.religion meeting.religion
    json.count meeting.count
  end
end

if @meeting_date.first.nil?
  json.date ''
else
  json.date @meeting_date.first.meeting_time.strftime('%Y')
end

