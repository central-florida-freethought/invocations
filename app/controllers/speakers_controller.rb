class SpeakersController < ApplicationController
  before_filter :authenticate_user!
  def search
    @speakers = Speaker.where('name like :name ', {name: "#{params[:name]}%"}).all.order('name').limit(10)
    respond_to do |format|
      format.json {render json: @speakers}
    end
  end
end
