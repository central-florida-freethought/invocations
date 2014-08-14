describe User do

  it { is_expected.to have_many(:user_meetings) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:phone_number) }
  it { is_expected.to validate_presence_of(:email) }

  context 'does' do
    let(:user) { FactoryGirl.create(:user) }
    context 'create a new User' do
      it 'with a version' do
        expect(user.versions).not_to be_empty
      end
    end
  end
end
