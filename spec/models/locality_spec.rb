require 'rails_helper'

RSpec.describe Locality, :type => :model do
  it { should belong_to(:contact) }

  describe 'Success' do
    it 'creates a new Locality given valid attributes' do
      locality = FactoryGirl.build(:locality)
      expect(locality).to be_valid
      expect { locality.save }.to change(Locality, :count).by(1)
    end
  end

  describe 'Failure' do
    it "doesn't create a Locality without a contact name" do
      locality = FactoryGirl.build :locality
      locality.contact.name = ''
      expect(locality).not_to be_valid
    end

    it "doesn't create a locality without a name" do
      locality = FactoryGirl.build :locality, name: ''
      expect(locality).not_to be_valid
    end

    it "doesn't create a locality without street address" do
      locality = FactoryGirl.build :locality, street_address: ''
      expect(locality).not_to be_valid
    end
  end
end
