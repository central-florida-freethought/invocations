class LocalitiesController < ApplicationController
  load_and_authorize_resource
  def new
    @locality = Locality.new params[:locality]
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
    params.require(:locality).permit :name, :country_code, :state_code, :city
  end
end
