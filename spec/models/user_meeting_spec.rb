require 'rails_helper'

RSpec.describe UserMeeting, :type => :model do
  it { should belong_to(:user) }

  describe 'Success' do
    it 'creates a new UserMeeting given valid attributes' do
      user_meeting = FactoryGirl.build(:user_meeting)
      expect(user_meeting).to be_valid
    end
  end

  describe 'Failure' do
    it "doesn't create a UserMeeting without a meeting_time" do
      user_meeting = FactoryGirl.build(:user_meeting, meeting_time: '')
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without an invocation_conducted" do
      user_meeting = FactoryGirl.build(:user_meeting, invocation_conducted: '')
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without a pledge_before" do
      user_meeting = FactoryGirl.build(:user_meeting, pledge_before: '')
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without asked_to_stand" do
      user_meeting = FactoryGirl.build(:user_meeting, asked_to_stand: '')
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without speaker_preached" do
      user_meeting = FactoryGirl.build(:user_meeting, speaker_preached: '')
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without speaker_praised" do
      user_meeting = FactoryGirl.build(:user_meeting, speaker_praised: '')
      expect(user_meeting).not_to be_valid
    end

    it "doesn't create a UserMeeting without a user association" do
      user_meeting = FactoryGirl.build(:user_meeting, user_id: '')
      expect(user_meeting).not_to be_valid
    end
  end
end
