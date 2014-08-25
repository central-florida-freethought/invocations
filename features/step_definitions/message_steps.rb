Then /^I should see "(.*?)"$/ do |message|
  expect(page).to have_content message
end

Then /^I should not see "(.*?)"$/i do |message|
  expect(page).not_to have_content message
end
