# Feature: create user meeting
#   As a volunteer
#   I want to create a user meeting
#   So the user meeting data can be collected
feature 'create user meeting' do

  describe 'successfully' do
    before :each do
      @user = FactoryGirl.create(:user)
      @user.confirm!
    end

    scenario 'without "Other" selections' do
      FactoryGirl.create(:locality, name: 'Bacontown')
      FactoryGirl.create(:religion, name: 'Crazyness')
      FactoryGirl.create(:denomination, name: 'Non-denominational')
      signin @user.email, @user.password
      visit new_user_meeting_path
      select 'Bacontown'
      choose 'Regular'
      fill_in 'Meeting time', with: Date.to_s
      choose 'user_meeting_invocation_conducted_yes'
      choose 'user_meeting_pledge_before_immediately_before'
      choose 'user_meeting_asked_to_stand_yes_by_speaker'
      choose 'user_meeting_speaker_preached_no'
      choose 'user_meeting_speaker_praised_no'
      fill_in 'Honorific', with: 'Mr.'
      fill_in 'Name of Speaker', with: 'Chunky Bacon'
      fill_in 'Organization or House of Worship', with: 'Hell House'
      find('#user_meeting_speaker_attributes_religion_id').select 'Crazyness'
      fill_in 'Concerns', with: 'Bacon ipsum dolor sit amet cillum beef ribs biltong cow, chuck tongue prosciutto turkey aliqua tri-tip. Short loin aute frankfurter laboris qui tail. Ham hock voluptate t-bone shankle, rump minim chuck dolore.'
      click_button 'Create meeting'
      expect(page).to have_content 'Your meeting was successfully created and will be reviewed.'
      expect(UserMeeting.last.speaker_id).to eq(Speaker.last.id)
    end
  end

  describe 'unsuccessfully' do
    scenario 'without logging in' do
      visit new_user_meeting_path
      expect(current_path).to eq(new_user_session_path)
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end
end
