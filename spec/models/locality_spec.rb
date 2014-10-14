describe Locality do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :street_address }
  it { is_expected.to validate_presence_of :city }
  it { is_expected.to validate_presence_of :state_code }
  it { is_expected.to validate_presence_of :country_code }
  it { is_expected.to validate_presence_of :zip }
  it { is_expected.to validate_presence_of :invocations_conducted }

  context 'successfully' do
    it 'creates a new Locality given valid attributes' do
      locality = Fabricate.build(:locality)
      expect(locality).to be_valid
      expect { locality.save }.to change(Locality, :count).by(1)
    end

    it 'creates a new Locality when a volunteer is not needed' do
      locality = Fabricate.build :locality, volunteer_needed: false
      expect(locality).to be_valid
    end
  end
end
