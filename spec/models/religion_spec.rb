require 'rails_helper'

RSpec.describe Religion, :type => :model do

  describe 'Failure' do
    it "doesn't create a religion without a name" do
      religion = FactoryGirl.build :religion, name: ''
      expect(religion).not_to be_valid
    end
  end
end
