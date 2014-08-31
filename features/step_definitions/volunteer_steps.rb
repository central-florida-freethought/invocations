Given /^the volunteer is active$/ do
  @volunteer.approve!
end

When /^I (de)?activate the volunteer$/ do |prefix|
  within '#confirmed_volunteers' do
    find("##{prefix}activate_volunteer_#{@volunteer.id}").click
  end
end

Then /^a(?:n)? (de)?activated email should be sent$/ do |prefix|
  expect(ActionMailer::Base.deliveries.last.subject).to eq "Account #{prefix}activated"
end
