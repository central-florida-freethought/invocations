feature 'locality' do

  context 'registered user' do
    given(:user) { Fabricate :user }

    context 'can not' do
      scenario 'create a new locality' do
        user.confirm!
        signin user.email, user.password
        visit new_locality_path
        expect(page).to have_content 'not authorized to create a new locality'
      end
    end
  end
end
