class LocalitiesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :report, :report_all]
  load_and_authorize_resource except: [:report, :report_all, :index]
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
    query +=   ' LEFT JOIN users ON user_meetings.user_id = users.id where '
    if id != nil
      query += " user_meetings.locality_id = #{id} and "
    end
    query += ' user_meetings.invocation_conducted like "Yes%" and user_meetings.pending = 0'
    query += ' GROUP BY religions.name '
    query += ' ORDER BY 2 DESC '
    @user_meetings = UserMeeting.find_by_sql(query)

  end

  private

  def locality_params
    params.require(:locality).
      permit :name, :phone_number, :street_address, :country_code, :state_code,
        :city, :zip, :location_notes, :website_url, :volunteer_needed, 
        :meeting_data_url, :meeting_schedule, :invocations_conducted, 
        :contact_name, :contact_title, :contact_email, :contact_phone,
        :contact_street_address, :contact_city, :contact_country_code,
        :contact_state_code, :contact_zip, :contact_notes
  end
end
