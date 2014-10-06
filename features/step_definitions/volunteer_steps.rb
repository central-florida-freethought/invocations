Given(/^the volunteer is active$/) do
  @volunteer.approve!
end

When(/^I (de)?activate the volunteer$/) do |prefix|
  within '#confirmed_volunteers' do
    find("##{prefix}activate_volunteer_#{@volunteer.id}").click
  end
end

Then(/^a(?:n)? (de)?activated email should be sent$/) do |prefix|
  last_subject = ActionMailer::Base.deliveries.last.subject
  expect(last_subject).to eq "Account #{prefix}activated"
end

