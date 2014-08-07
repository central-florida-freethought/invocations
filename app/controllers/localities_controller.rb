class LocalitiesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
    @locality = Locality.new params[:locality]
    @locality.build_contact
  end

  def create
    @locality = Locality.new locality_params
    if @locality.save
      redirect_to @locality, notice: "#{@locality.name} locality successfully created"
    else
      render :new
    end
  end

  def show
    @locality = Locality.find(params[:id])
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
