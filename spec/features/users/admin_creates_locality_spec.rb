feature 'admin creates locality' do
  given!(:admin) { FactoryGirl.create(:user, :admin) }

  scenario 'successfully creates a new locality' do
    admin.confirm!
    signin(admin.email, admin.password)
    visit new_locality_path
    select 'Florida'
    fill_in 'City', with: 'Bacontown'
    fill_in 'Locality name', with: 'Awesomeness'
    click_button 'Create Locality'
    expect(page).to have_content 'Awesomeness locality successfully created'
  end
end
