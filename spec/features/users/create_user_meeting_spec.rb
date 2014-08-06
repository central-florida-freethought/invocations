# Feature: create user meeting
#   As a volunteer
#   I want to create a user meeting
#   So the user meeting data can be collected
feature 'create user meeting' do
  before :each do
    @user = FactoryGirl.create(:user)
    @user.confirm!
  end

  scenario 'create new user meeting without "Other" selections successfully' do
    FactoryGirl.create(:locality, name: 'Bacontown')
    FactoryGirl.create(:religion, name: 'Crazyness')
    FactoryGirl.create(:denomination, name: 'Non-denominational')
    signin @user.email, @user.password
    visit new_user_meeting_path
    select 'Bacontown'
    choose 'Regular'
    select Date.today.month
    select Date.today.year
    select Date.today.day
    select '06 PM'
    select '00'
    within '.user_meeting_invocation_conducted' do
      choose 'Yes'
    end
    within '.user_meeting_pledge_before' do
      choose 'Immediately before'
    end
    within '.user_meeting_asked_to_stand' do
      choose 'Yes, by speaker'
    end
    within '.user_meeting_speaker_preached' do
      choose 'No'
    end
    within '.user_meeting_speaker_praised' do
      choose 'No'
    end
    fill_in 'Honorific', with: 'Mr.'
    fill_in 'Name of Speaker', with: 'Chunky Bacon'
    fill_in 'Organization or House of Worship', with: 'Hell House'
    find('#user_meeting_speaker_attributes_religion_id').select 'Crazyness'
    find('#user_meeting_speaker_attributes_denomination_id').select 'Non-denominational'
    fill_in 'Concerns', with: 'Bacon ipsum dolor sit amet cillum beef ribs biltong cow, chuck tongue prosciutto turkey aliqua tri-tip. Short loin aute frankfurter laboris qui tail. Ham hock voluptate t-bone shankle, rump minim chuck dolore.'
    click_button 'Create User meeting'
    expect(page).to have_content 'Your meeting was successfully created and will be reviewed.'
  end
end
