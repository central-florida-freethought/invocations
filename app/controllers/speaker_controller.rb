class SpeakerController < ApplicationController
  before_filter :authenticate_user!
  def search
    @speakers = Speaker.where('name like :name ', {name: "#{params[:name]}%"}).all
    respond_to do |format|
      format.json {render json: @speakers}
    end
  end
end
