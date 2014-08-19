describe Speaker do
  it { is_expected.to belong_to(:organization) }
  it { is_expected.to belong_to(:religion) }
  it { is_expected.to belong_to(:denomination) }
  it { is_expected.to validate_presence_of(:name) }

  let(:speaker) { FactoryGirl.build :speaker }

  describe 'successfully' do
    it 'creates a new Speaker given valid attributes' do
      expect(speaker).to be_valid
      expect { speaker.save }.to change(Speaker, :count).by(1)
    end
  end
end
