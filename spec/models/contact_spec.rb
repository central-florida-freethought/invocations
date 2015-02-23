describe Contact do
  it { is_expected.to have_many(:localities) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :phone }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :street_address }
  it { is_expected.to validate_presence_of :city }
  it { is_expected.to validate_presence_of :state_code }
  it { is_expected.to validate_presence_of :country_code }
  it { is_expected.to validate_presence_of :zip }
end

