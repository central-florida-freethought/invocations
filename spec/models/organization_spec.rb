require 'rails_helper'

RSpec.describe Organization, :type => :model do

  describe 'Failure' do
    it "doesn't create a new Organization without a name" do
      org = FactoryGirl.build :organization, name: ''
      expect(org).not_to be_valid
    end
  end
end
