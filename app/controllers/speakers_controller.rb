class SpeakersController < ApplicationController
  before_action :authenticate_user!
  def search
    @speakers = Speaker
      .where('name like :name ', name: "#{params[:name]}%")
      .order(:name)
      .limit(10)
    respond_to do |format|
      format.json { render json: @speakers }
    end
  end

  def show
    @speaker = Speaker.find params[:id]
  end
end

