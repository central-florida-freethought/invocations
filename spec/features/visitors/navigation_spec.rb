# Feature: Navigation links
#   As a visitor
#   I want to see navigation links
#   So I can find home, sign in, or sign up
feature 'Navigation links', :devise do
  # Scenario: View navigation links
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "home," "sign in," and "sign up"
  scenario 'view navigation links' do
    visit root_path
    expect(page).to have_content 'Home'
    expect(page).to have_content 'More Info'
    expect(page).to have_content 'Volunteer'
    expect(page).to have_content 'Help'
    expect(page).to have_content 'Locations'
    expect(page).to have_content 'Log in'
  end
end

