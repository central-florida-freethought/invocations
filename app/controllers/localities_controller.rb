class LocalitiesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :report, :report_all]
  load_and_authorize_resource
  respond_to :html

  def edit
    @locality = Locality.find params[:id]
    respond_with @locality
  end

  def index
    @localities = Locality.all
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

  def report
    @user_meetings = locality_report(params[:id])
    respond_to do |format|
      format.json { render json: @user_meetings}
    end
  end

  def report_all
    @user_meetings = locality_report(nil)
    respond_to do |format|
      format.json { render json: @user_meetings}
    end
  end

  private
  def locality_report(id)
    query = ' SELECT  '
    query +=   'religions.name AS "religion", '
    query +=   'count(religions.name) AS "count" '
    query += ' FROM '
    query +=   ' user_meetings '
    query +=   ' LEFT JOIN localities ON user_meetings.locality_id = localities.id '
    query +=   ' LEFT JOIN speakers ON user_meetings.speaker_id = speakers.id '
    query +=   ' LEFT JOIN religions ON speakers.religion_id = religions.id '
    query +=   ' LEFT JOIN users ON user_meetings.user_id = users.id '
    if id != nil
      query += " where user_meetings.locality_id = #{id}"
    end
    query += ' GROUP BY religions.name '
    query += ' ORDER BY "count" DESC '
    @user_meetings = UserMeeting.find_by_sql(query)

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
