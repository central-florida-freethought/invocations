require 'rails_helper'

RSpec.describe Locality, :type => :model do
  it 'creates a new Locality given valid attributes' do
    locality = FactoryGirl.build(:locality)
    expect(locality).to be_valid
    expect { locality.save }.to change(Locality, :count).by(1) 
  end
end
