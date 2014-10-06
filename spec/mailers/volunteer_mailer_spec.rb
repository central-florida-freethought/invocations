describe VolunteerMailer do
  let(:user) { Fabricate :user, confirmed_at: Time.now, approved: true }

  it 'sends approved email to correct email' do
    email = VolunteerMailer.approved_email(user)
    expect(email.to.first).to eq user.email
  end

  it 'has the correct URL for new user meeting' do
    email = VolunteerMailer.approved_email(user)
    expect(email.body).to include new_user_meeting_url
  end
end

