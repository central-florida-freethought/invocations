require 'rails_helper'

RSpec.describe Contact, :type => :model do
  it { should have_many(:localities) }
  
  describe 'Failure' do
    it "doesn't create a Contact without a name" do
      contact = FactoryGirl.build :contact, name: ''
      expect(contact).not_to be_valid
    end
  end
end
