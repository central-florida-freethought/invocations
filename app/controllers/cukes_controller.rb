class CukesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :user

  def index
    render layout: false
  end
end

