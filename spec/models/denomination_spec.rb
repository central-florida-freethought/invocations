require 'rails_helper'

RSpec.describe Denomination, :type => :model do

  describe 'Failure' do
    it "doesn't create a Denomination without a name" do
      denomination = FactoryGirl.build :denomination, name: ''
      expect(denomination).not_to be_valid
    end
  end
end
