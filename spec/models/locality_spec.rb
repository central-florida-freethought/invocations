describe Locality do
  it { is_expected.to belong_to(:contact) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :street_address }
  it { is_expected.to validate_presence_of :city }
  it { is_expected.to validate_presence_of :state_code }
  it { is_expected.to validate_presence_of :country_code }
  it { is_expected.to validate_presence_of :zip }
  it { is_expected.to validate_presence_of :volunteer_needed }
  it { is_expected.to validate_presence_of :invocations_conducted }
  it { is_expected.to validate_presence_of :contact }

  context 'successfully' do
    it 'creates a new Locality given valid attributes' do
      locality = FactoryGirl.build(:locality,
        contact_attributes: FactoryGirl.attributes_for(:contact))
      expect(locality).to be_valid
      expect { locality.save }.to change(Locality, :count).by(1)
    end
  end
end
