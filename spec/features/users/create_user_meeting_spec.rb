# Feature: create user meeting
#   As a volunteer
#   I want to create a user meeting
#   So the user meeting data can be collected
feature 'create user meeting' do
  def fill_in_fields
    select locality.name
    choose 'Regular'
    fill_in 'Meeting time', with: DateTime.now
    choose 'user_meeting_invocation_conducted_yes'
    choose 'user_meeting_pledge_before_immediately_before'
    choose 'user_meeting_asked_to_stand_yes_by_speaker'
    choose 'user_meeting_speaker_preached_no'
    choose 'user_meeting_speaker_praised_no'
    fill_in 'Honorific', with: 'Mr.'
    fill_in 'Name of Speaker', with: 'Chunky Bacon'
    fill_in 'Organization or House of Worship', with: 'Hell House'
    find('#user_meeting_speaker_attributes_religion_id').select religion.name
    fill_in 'Concerns', with: 'Bacon ipsum dolor sit amet cillum beef ribs biltong cow, chuck tongue prosciutto turkey aliqua tri-tip. Short loin aute frankfurter laboris qui tail. Ham hock voluptate t-bone shankle, rump minim chuck dolore.'
  end

  context 'successfully' do
    given!(:locality) { Fabricate :locality }
    given!(:religion) { Fabricate :religion }
    given!(:user) { Fabricate :user, first_name: 'Chunky' }

    background do
      user.confirm!
      user.approve!
    end

    scenario 'that is pending' do
      user.roles = [:user]
      user.save!
      signin user.email, user.password
      visit new_user_meeting_path
      fill_in_fields
      click_button 'Create meeting'
      expect(page).to have_content 'Your meeting was successfully created and will be reviewed.'
      expect(UserMeeting.last.user_id).to eq(user.id)
      expect(UserMeeting.last.pending).to eql(true)
      expect(UserMeeting.last.speaker_id).to eq(Speaker.last.id)
    end

    context 'by a trusted user' do

      scenario 'that is auto-approved' do
        user.roles = [:user, :trusted]
        user.save!
        signin user.email, user.password
        visit new_user_meeting_path
        fill_in_fields
        click_button 'Create meeting'
        expect(UserMeeting.last.user_id).to eq(user.id)
        # expect(page).to have_content 'and approved.'
        expect(UserMeeting.last.pending).to eql(false)
      end
    end
  end

  context 'unsuccessfully' do
    scenario 'without logging in' do
      visit new_user_meeting_path
      expect(current_path).to eq(new_user_session_path)
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end
end
