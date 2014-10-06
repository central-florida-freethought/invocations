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
end

