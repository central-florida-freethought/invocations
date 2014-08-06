require 'rails_helper'

RSpec.describe UserMeeting, :type => :model do
  it { should belong_to(:user) }
  it { should belong_to(:speaker) }

  describe 'Success' do
    it 'creates a new UserMeeting given valid attributes' do
      user_meeting = FactoryGirl.build :user_meeting
      expect(user_meeting).to be_valid
      expect { user_meeting.save }.to change(UserMeeting, :count).by(1)
    end

    it 'creates a new associated Speaker' do
      user_meeting = FactoryGirl.build :user_meeting
      expect { user_meeting.save }.to change(Speaker, :count).by(1)
      expect(user_meeting.speaker_id).to eq(Speaker.first.id)
    end
  end

  describe 'Failure' do
    it "doesn't create a UserMeeting without a locality" do
      user_meeting = FactoryGirl.build :user_meeting, locality_id: ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without a meeting_type" do
      user_meeting = FactoryGirl.build :user_meeting, meeting_type: ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without a meeting_time" do
      user_meeting = FactoryGirl.build :user_meeting, meeting_time: ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without an invocation_conducted" do
      user_meeting = FactoryGirl.build :user_meeting, invocation_conducted: ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without a pledge_before" do
      user_meeting = FactoryGirl.build :user_meeting, pledge_before: ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without asked_to_stand" do
      user_meeting = FactoryGirl.build :user_meeting, asked_to_stand: ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without speaker_preached" do
      user_meeting = FactoryGirl.build :user_meeting, speaker_preached: ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without speaker_praised" do
      user_meeting = FactoryGirl.build :user_meeting, speaker_praised: ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without a User association" do
      user_meeting = FactoryGirl.build :user_meeting, user_id: ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without speaker name" do
      user_meeting = FactoryGirl.build :user_meeting
      user_meeting.speaker.name = ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without an organization" do
      user_meeting = FactoryGirl.build :user_meeting
      user_meeting.speaker.organization.name = ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without a religion" do
      user_meeting = FactoryGirl.build :user_meeting
      user_meeting.speaker.religion.name = ''
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without a denomination" do
      user_meeting = FactoryGirl.build :user_meeting
      user_meeting.speaker.denomination.name = ''
      expect(user_meeting).not_to be_valid
    end
  end
end
