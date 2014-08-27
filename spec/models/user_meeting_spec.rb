describe UserMeeting do

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:speaker) }
  it { is_expected.to belong_to(:locality) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:locality) }
  it { is_expected.to validate_presence_of(:meeting_type) }
  it { is_expected.to validate_presence_of(:meeting_time) }
  it { is_expected.to validate_presence_of(:invocation_conducted) }
  it { is_expected.to validate_presence_of(:pledge_before) }
  it { is_expected.to validate_presence_of(:asked_to_stand) }
  it { is_expected.to validate_presence_of(:speaker_preached) }
  it { is_expected.to validate_presence_of(:speaker_praised) }

  context 'does' do
    context 'create a new UserMeeting' do
      let(:religion) { Fabricate :religion }
      let(:user_meeting) do
        Fabricate.build :user_meeting,
          speaker_attributes: { religion: religion }
      end

      it 'given valid attributes' do
        expect(user_meeting).to be_valid
        expect { user_meeting.save }.to change(UserMeeting, :count).by(1)
      end

      it 'with an associated Speaker' do
        expect { user_meeting.save }.to change(Speaker, :count).by(1)
        expect(user_meeting.speaker_id).to eq(Speaker.first.id)
      end
    end
  end

  context 'does not' do
    context 'create a UserMeeting' do
      let(:user_meeting) { Fabricate.build :user_meeting }

      it "without speaker name" do
        user_meeting.speaker.name = ''
        expect(user_meeting).not_to be_valid
      end

      it "without an organization" do
        user_meeting.speaker.organization.name = ''
        expect(user_meeting).not_to be_valid
      end

      it "without a religion" do
        user_meeting.speaker.religion.name = ''
        expect(user_meeting).not_to be_valid
      end

      it "without a denomination" do
        user_meeting.speaker.denomination.name = ''
        expect(user_meeting).not_to be_valid
      end
    end
    it 'destroy an associated speaker' do
      user_meeting = Fabricate :user_meeting
      expect { user_meeting.destroy }.not_to change(Speaker, :count)
    end
  end
end
