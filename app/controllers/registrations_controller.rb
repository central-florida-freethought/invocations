class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit :first_name, :last_name, :email, :phone_number,
      :password, :password_confirmation, :locality_id
  end

  def account_update_params
    params.require(:user).permit :first_name, :last_name, :email, :phone_number,
      :password, :password_confirmation, :locality_id, :current_password
  end
end
