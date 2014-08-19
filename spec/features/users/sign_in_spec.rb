# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :devise do
  given(:user) { Fabricate :user }

  context 'user cannot sign in' do

    # Scenario: User cannot sign in if not registered
    #   Given I do not exist as a user
    #   When I sign in with valid credentials
    #   Then I see an invalid credentials message
    scenario 'if not registered' do
      signin Faker::Internet.email, 'please123'
      expect(page).to have_content 'Invalid email or password.'
    end

    # Scenario: User cannot sign in with wrong email
    #   Given I exist as a user
    #   And I am not signed in
    #   When I sign in with a wrong email
    #   Then I see an invalid email message
    scenario 'with wrong email' do
      signin 'invalid@email.com', user.password
      expect(page).to have_content 'Invalid email or password.'
    end

    # Scenario: User cannot sign in with wrong password
    #   Given I exist as a user
    #   And I am not signed in
    #   When I sign in with a wrong password
    #   Then I see an invalid password message
    scenario 'with wrong password' do
      signin user.email, 'invalidpass'
      expect(page).to have_content 'Invalid email or password.'
    end
  end

  context 'user can sign in' do
    given(:user) { Fabricate :user }

    before do
      user.confirm!
    end

    # Scenario: User can sign in with valid credentials
    #   Given I exist as a user
    #   And I am not signed in
    #   When I sign in with valid credentials
    #   Then I see a success message
    scenario 'with valid credentials but not approved' do
      signin user.email, user.password
      expect(user.approved?).to be(false)
      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content 'admin will review'
    end

    context 'with approval' do

      before do
        user.approve!
      end

      scenario 'and valid credentials' do
        signin user.email, user.password
        expect(page).to have_content 'Signed in successfully'
        expect(page).not_to have_content 'admin will review'
      end
    end
  end
end
