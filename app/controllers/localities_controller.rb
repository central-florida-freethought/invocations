class LocalitiesController < ApplicationController
  before_action :authenticate_user!,
                except: [:index, :show, :report, :report_all]
  load_and_authorize_resource except: [:report, :report_all, :index]
  helper_method :sort_column, :sort_direction
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
    @user_meetings = @locality
      .user_meetings
      .includes({ speaker: [:religion, :organization] }, :locality)
      .paginate(page: params[:page])
      .approved()
      .order(sort_column + ' ' + sort_direction)
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
      format.json { render json: @user_meetings }
    end
  end

  def report_all
    @user_meetings = locality_report(nil)
    respond_to do |format|
      format.json { render json: @user_meetings }
    end
  end

  private

  def locality_report(id)
    meetings = UserMeeting
      .joins { [locality.outer, speaker.outer.religion.outer, user.outer] }
      .select('religions.name as religion, count(religions.name) as count')
      .where(invocation_conducted: 'Yes')
      .group('religions.name')
      .approved
      .order('2 DESC')

    return meetings unless id
    meetings.where { locality_id.eq id }
  end

  private

  def locality_params
    params.require(:locality)
      .permit :name, :phone_number, :street_address, :country_code, :state_code,
              :city, :zip, :location_notes, :website_url, :volunteer_needed,
              :meeting_data_url, :meeting_schedule, :invocations_conducted,
              :contact_name, :contact_title, :contact_email, :contact_phone,
              :contact_street_address, :contact_city, :contact_country_code,
              :contact_state_code, :contact_zip, :contact_notes
  end

  def sort_column
    UserMeeting.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end
end

