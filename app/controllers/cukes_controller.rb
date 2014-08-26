class CukesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :user
  
  def index
    render layout: false
  end
end