class LocalitiesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :html

  def edit
    @locality = Locality.find params[:id]
    respond_with @locality
  end

  def index
    @localities = Locality.all
    respond_to do |format|
      format.html
      format.json { render json: @localities}
    end
  end

  def new
    @locality = Locality.new params[:locality]
    @locality.build_contact
    respond_with @locality
  end

  def create
    @locality = Locality.new locality_params
    if @locality.save
      flash[:notice] = "#{@locality.name} locality successfully created"
    end
    respond_with @locality
  end

  def show
    @locality = Locality.find params[:id]
    respond_with @locality
  end

  def update
    @locality = Locality.find params[:id]
    if @locality.update_attributes(locality_params)
      flash[:notice] = 'Locality was successfully updated'
    end
    respond_with @locality
  end

  private

  def locality_params
    params.require(:locality).
      permit :name,
             :street_address,
             :country_code,
             :state_code,
             :city,
             :zip,
             :location_notes,
             :website_url,
             :volunteer_needed,
             :meeting_data_url,
             :meeting_schedule,
             :invocations_conducted,
             contact_attributes: [:name,
                                  :title,
                                  :phone,
                                  :email,
                                  :street_address,
                                  :city,
                                  :state_code,
                                  :country_code,
                                  :zip,
                                  :notes]
  end
end
