Given /^a locality with name "(.*?)"$/ do |name|
  @locality = Fabricate :locality, name: name
end

Given /^a religion$/ do
  @religion = Fabricate :religion
end

When "I visit the localities page" do
  visit localities_path
end

When "I visit the new user meeting page" do
  visit new_user_meeting_path
end

When /^I click "(.*?)"$/ do |text|
  click_on text
end

When /^I fill in the meeting fields$/ do
  select 'Regular'
  fill_in 'Meeting time', with: DateTime.now
  within '#user_meeting_invocation_conducted' do
    select 'Yes'
  end
  within '#user_meeting_pledge_before' do
    select 'Immediately before'
  end
  within '#user_meeting_asked_to_stand' do
    select 'Yes, by speaker'
  end
  within '#user_meeting_speaker_preached' do
    select 'No'
  end
  within '#user_meeting_speaker_praised' do
    select 'No'
  end
  fill_in 'Honorific', with: 'Mr.'
  fill_in 'Name of Speaker', with: 'Chunky Bacon'
  fill_in 'Organization or House of Worship', with: 'Hell House'
  find('#user_meeting_speaker_attributes_religion_id').select @religion.name
  fill_in 'Concerns', with: 'Bacon ipsum dolor sit amet cillum beef ribs biltong cow, chuck tongue prosciutto turkey aliqua tri-tip. Short loin aute frankfurter laboris qui tail. Ham hock voluptate t-bone shankle, rump minim chuck dolore.'
end

Then 'I should be on the login page' do
  expect(current_path).to eq(new_user_session_path)
end

Then /^the meeting should have my user ID$/ do
  expect(UserMeeting.last.user_id).to eq @user.id
end

Then 'the meeting should be pending' do
  expect(UserMeeting.last.pending).to eq true
end

Then 'the meeting should not be pending' do
  expect(UserMeeting.last.pending).to eq false
end

Then 'the meeting should have a Speaker' do
  expect(UserMeeting.last.speaker_id).not_to be_nil
end
