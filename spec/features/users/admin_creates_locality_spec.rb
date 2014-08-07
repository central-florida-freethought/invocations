feature 'admin creates locality' do
  given!(:admin) { FactoryGirl.create(:user, :admin) }

  scenario 'successfully creates a new locality' do
    admin.confirm!
    signin(admin.email, admin.password)
    visit new_locality_path
    fill_in 'Locality name', with: Faker::Name.name
    fill_in 'locality[street_address]', with: Faker::Address.street_address
    fill_in 'locality[city]', with: Faker::Address.city
    select 'Florida', from: 'locality[state_code]'
    fill_in 'locality[zip]', with: Faker::Address.zip
    fill_in 'locality[location_notes]', with: Faker::Lorem.sentence
    fill_in 'locality[website_url]', with: Faker::Internet.url
    choose 'locality_volunteer_needed_true'
    fill_in 'locality[meeting_data_url]', with: Faker::Internet.url
    fill_in 'locality[meeting_schedule]', with: Faker::Lorem.sentence
    choose 'locality_invocations_conducted_true'
    fill_in 'locality[contact_attributes][name]', with: Faker::Name.name
    fill_in 'locality[contact_attributes][title]', with: Faker::Name.title
    fill_in 'locality[contact_attributes][phone]', with: Faker::PhoneNumber.phone_number
    fill_in 'locality[contact_attributes][email]', with: Faker::Internet.email
    fill_in 'locality[contact_attributes][street_address]', with: Faker::Address.street_address
    fill_in 'locality[contact_attributes][city]', with: Faker::Address.city
    select 'Florida', from: 'locality[contact_attributes][state_code]'
    fill_in 'locality[contact_attributes][zip]', with: Faker::Address.zip
    fill_in 'locality[contact_attributes][notes]', with: Faker::Lorem.sentence
    click_button 'Create Locality'
    expect(page.text).to match /locality successfully created/
    expect(Locality.last.contact).not_to be_nil
  end
end
