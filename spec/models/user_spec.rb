describe User do

  it { is_expected.to have_many(:user_meetings) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:phone_number) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to respond_to(:versions) }

  it 'returns full name' do
    user = Fabricate :user,
                     first_name: 'Chunky',
                     last_name: 'Bacon',
                     confirmed_at: Time.now
    expect(user.full_name).to eq('Chunky Bacon')
  end
end

