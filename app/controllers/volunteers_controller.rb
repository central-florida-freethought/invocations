class VolunteersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :user
  
  def inactive
    @confirmed_volunteers = User.where.not(confirmed_at: nil).where(approved: false)
  end
  
  def active
    @confirmed_volunteers = User.where.not(confirmed_at: nil).where(approved: true)
  end
end
