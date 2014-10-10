class VolunteersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :user

  def inactive
    @confirmed_volunteers = User
      .where.not(confirmed_at: nil)
      .where(approved: false)
  end

  def active
    @confirmed_volunteers = User
      .where.not(confirmed_at: nil)
      .where(approved: true)
  end

  def show
    @volunteer = User.find params[:id]
  end

  def update
    @volunteer = User.find params[:id]
    if @volunteer.update_attributes(user_params)
      redirect_to :back,
                  notice: 'Volunteer was successfully updated'
    else
      render :active
    end
  end

  private

  def user_params
    params.require(:user).permit(roles: [])
  end
end

