class OrganizationsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @org = Organization.find(params[:id])
    respond_to do |format|
      format.json {render json: @org}
    end
  end
end
