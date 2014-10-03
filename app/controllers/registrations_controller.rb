class RegistrationsController < Devise::RegistrationsController
  def activate
    @user = User.find params[:id]
    if @user.update_attributes approved: true
      VolunteerMailer.approved_email(@user).deliver
      redirect_to inactive_volunteers_path,
                  notice: t('devise.registrations.activated')
    else
      render inactive_volunteers_path,
             error: t('devise.registrations.activated_error')
    end
  end

  def deactivate
    @user = User.find params[:id]
    if @user.update_attributes approved: false
      VolunteerMailer.deactivated_email(@user).deliver
      redirect_to active_volunteers_path,
                  notice: t('devise.registrations.deactivated')
    else
      render active_volunteers_path,
             error: t('devise.registrations.deactiveated_error')
    end
  end

  private

  def sign_up_params
    params.require(:user)
      .permit :first_name, :last_name, :email, :phone_number,
              :password, :password_confirmation, :locality_id, :roles
  end

  def account_update_params
    params.require(:user)
      .permit :first_name, :last_name, :email, :phone_number,
              :password, :password_confirmation, :locality_id,
              :current_password, :roles, :approved
  end
end

