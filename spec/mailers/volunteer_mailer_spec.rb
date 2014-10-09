describe VolunteerMailer do
  let(:user) { Fabricate :user, confirmed_at: Time.now, approved: true }

  it 'sends approved email to correct email' do
    email = VolunteerMailer.approved_email(user)
    expect(email.to.first).to eq user.email
  end
end

