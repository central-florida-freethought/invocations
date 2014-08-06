require 'rails_helper'

RSpec.describe Speaker, :type => :model do
  it { should belong_to(:organization) }
  it { should belong_to(:religion) }
  it { should belong_to(:denomination) }

  describe 'Success' do
    it 'creates a new Speaker given valid attributes' do
      speaker = FactoryGirl.build :speaker
      expect(speaker).to be_valid
      expect { speaker.save }.to change(Speaker, :count).by(1)
    end
  end

  describe 'Failure' do
    it "doesn't create a speaker without a name" do
      speaker = FactoryGirl.build :speaker, name: ''
      expect(speaker).not_to be_valid
    end
  end
end
