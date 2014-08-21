feature 'volunteer' do
  context 'admin user' do
    given!(:admin) { Fabricate :user, email: 'chunky@bacon.com' }
    given!(:volunteer) { Fabricate :user, email: 'volunteer@example.com' }

    background do
      admin.admin!
      admin.confirm!
      admin.approve!
      signin(admin.email, admin.password)
    end

    context 'for confirmed users can' do

      background do
        volunteer.confirm!
      end

      scenario 'view the pending volunteers' do
        visit inactive_volunteers_path
        within '#confirmed_volunteers' do
          expect(page).to have_content volunteer.full_name
        end
      end

      scenario 'activate a confirmed, inactive volunteer' do
        visit inactive_volunteers_path
        within '#confirmed_volunteers' do
          find("#activate_volunteer_#{volunteer.id}").click
        end
        expect(page).to have_content 'Volunteer was successfully activated and an email has been sent.'
        expect(page).not_to have_content volunteer.full_name
        expect(ActionMailer::Base.deliveries.last.subject).to eq 'Account activated'
      end
      
      scenario 'inactivate a confirmed, active volunteer' do
        volunteer.approve!
        visit active_volunteers_path
        within '#confirmed_volunteers' do
          find("#deactivate_volunteer_#{volunteer.id}").click
        end
        expect(page).to have_content 'Volunteer was successfully deactivated and an email has been sent.'
        expect(ActionMailer::Base.deliveries.last.subject).to eq 'Account deactivated'
      end
    end
  end
end
