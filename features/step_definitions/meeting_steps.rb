Given /^a (\w+)(?: with (\w+) "(.*?)")?$/ do |model, attribute, value|
  if attribute
    instance_variable_set "@#{model}", Fabricate(model, attribute => value)
  else
    instance_variable_set "@#{model}", Fabricate(model)
  end
end

Given /^a (\w+) speaker$/i do |religion_name|
  religion = Fabricate :religion, name: 'Christian'
  @speaker = Fabricate :speaker, religion: religion
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

When /^I add a new meeting with an existing speaker$/ do
  visit localities_path
  click_on @locality.name
  click_on "Submit a new meeting"
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
  fill_in 'Name of Speaker', with: @speaker.name
  fill_in 'Organization or House of Worship', with: 'Hell House'
  find('#user_meeting_speaker_attributes_religion_id').select @speaker.religion.name
  fill_in 'Concerns', with: 'Bacon ipsum dolor sit amet cillum beef ribs biltong cow, chuck tongue prosciutto turkey aliqua tri-tip. Short loin aute frankfurter laboris qui tail. Ham hock voluptate t-bone shankle, rump minim chuck dolore.'
  find('#create-meeting-btn').trigger('click')
end

Then 'I should be on the login page' do
  expect(current_path).to eq(new_user_session_path)
end

Then /^a new speaker should not have been created$/ do
  expect(Speaker.count).to eq 1
end
