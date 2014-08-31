module SessionHelper
  def sign_up_with(first_name, last_name, email, phone, password, confirmation, locality_name=nil)
    visit new_user_registration_path
    fill_in 'First name', with: first_name
    fill_in 'Last name', with: last_name
    fill_in 'Email', with: email
    fill_in 'Phone number', with: phone
    fill_in 'Password', with: password
    fill_in 'Password confirmation', :with => confirmation
    if locality_name
      select locality_name, from: 'user_locality_id'
    end
    click_button 'Sign up'
  end

  def sign_in_user(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
end

World SessionHelper