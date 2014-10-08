Given(/^the volunteer is active$/) do
  @volunteer.approve!
end

Given(/^the volunteer does not have the (\w+) role$/) do |role|
  @volunteer.roles = []
  @volunteer.save!
  expect(@volunteer.is? role).not_to eq true
end

When(/^I (de)?activate the volunteer$/) do |prefix|
  within '#confirmed_volunteers' do
    find("##{prefix}activate_volunteer_#{@volunteer.id}").click
  end
end

When(/^I add the (\w+) role$/) do |role|
  vol_id = @volunteer.id
  within "#volunteer_#{vol_id}_roles" do
    find("#user_#{vol_id}_role_#{role}").set true
    click_on 'Update'
  end
end

Then(/^a(?:n)? (de)?activated email should be sent$/) do |prefix|
  last_subject = ActionMailer::Base.deliveries.last.subject
  expect(last_subject).to eq "Account #{prefix}activated"
end

Then(/^the volunteer should have the (\w+) role$/) do |role|
  expect(@volunteer.roles).to include(role)
end

