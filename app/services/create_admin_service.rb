class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.confirm!
        user.admin!
        user.first_name = Rails.application.secrets.admin_firstname
        user.last_name = Rails.application.secrets.admin_lastname
        user.phone_number = Rails.application.secrets.admin_phone
      end
  end
end
