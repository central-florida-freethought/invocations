describe Contact do

  it { is_expected.to have_many(:localities) }
  it { is_expected.to validate_presence_of(:name) }
  
end
