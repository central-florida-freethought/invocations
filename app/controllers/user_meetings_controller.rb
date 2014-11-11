class UserMeetingsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  respond_to :html

  def index
    @user_meetings = current_user
      .user_meetings
      .includes({ speaker: [:religion, :organization] }, :locality)
      .paginate(page: params[:page])
      .order(sort_column + ' ' + sort_direction)
    respond_with @user_meetings
  end

  def admin
    return unless current_user.has_role?(:admin)
    @user_meetings = UserMeeting
      .includes({ speaker: [:religion, :organization] }, :locality)
      .paginate(page: params[:page])
      .pending.order(sort_column + ' ' + sort_direction)
    respond_with @user_meetings
  end

  def new
    @locality = Locality.find params[:locality_id]
    @user_meeting = current_user.user_meetings.build params[:user_meeting]
    @user_meeting.build_speaker
    respond_with @user_meeting
  end

  def show
    @user_meeting = UserMeeting.find(params[:id])
    respond_with @user_meeting
  end

  def approve
    # Need some kind of validation?
    @user_meeting = UserMeeting.find(params[:id])
    @user_meeting.approve!
    MeetingMailer.approval_request(@user_meeting).deliver_later
    redirect_to admin_user_meetings_path, notice: t('user_meeting.admin.approved')
  end

  def deny
    @user_meeting = UserMeeting.find params[:id]
    @user_meeting.deny!
    MeetingMailer.approval_request(@user_meeting).deliver_later
    redirect_to admin_user_meetings_path, notice: t('user_meeting.admin.denied')
  end

  def review
    @user_meeting = UserMeeting.find params[:id]
    @user_meeting.review!
    MeetingMailer.approval_request(@user_meeting).deliver_later
    redirect_to admin_user_meetings_path, notice: t('user_meeting.admin.reviewed')
  end

  def create
    @locality = Locality.find params[:locality_id]
    @user_meeting = current_user.user_meetings.build user_meeting_params
    @user_meeting.speaker =
      find_or_create_speaker if user_meeting_params[:speaker_attributes]

    flash[:notice] = get_flash(@user_meeting) if @user_meeting.save
    respond_with @locality, @user_meeting, location: user_meetings_path
  end

  def edit
    @locality = Locality.find params[:locality_id]
    @user_meeting = UserMeeting.find params[:id]
  end

  def update
    @user_meeting = UserMeeting.find params[:id]
    if @user_meeting.update_attributes(user_meeting_params)
      unless current_user.has_role?(:trusted) || current_user.has_role?(:admin)
        @user_meeting.aasm_state = 'pending'
        @user_meeting.save
      end
      flash[:notice] = 'Meeting was successfully updated'
    end
    respond_with @locality, @user_meeting, location: path_for_meetings
  end

  private

  def path_for_meetings
    return user_meetings_path unless current_user.has_role?(:admin)
    admin_user_meetings_path
  end

  def find_or_create_speaker
    Speaker.find_by(name: user_meeting_params[:speaker_attributes][:name]) ||
      Speaker.new(user_meeting_params[:speaker_attributes])
  end

  def get_flash(meeting)
    if meeting.pending?
      t('user_meeting.created_pending')
    else
      t('user_meeting.created_approved')
    end
  end

  def report
    @user_meeting = UserMeeting.all
    respond_to do |format|
      format.json { render json: @user_meeting }
    end
  end

  def user_meeting_params
    params.require(:user_meeting)
          .permit :id, :meeting_type, :meeting_time, :invocation_conducted,
                  :pledge_before, :asked_to_stand, :speaker_preached,
                  :speaker_preached_explanation, :speaker_praised,
                  :speaker_praised_explanation, :concerns, :attachment,
                  :street_address, :meeting_url, :minutes_url,
                  :agenda_url, :media_url, :user_id, :locality_id,
                  speaker_attributes: [:id, :name, :honorific, :religion_id,
                                       :denomination_id,
                                       organization_attributes: [:id, :name]]
  end

  private

  def sort_column
    UserMeeting.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  private

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end

  private

  def prev_count(records_per_page)
    if record_offset == 0
      record_offset
    elsif record_offset > 0 && record_offset < 10
      0
    else
      record_offset - records_per_page
    end
  end

  private

  def record_offset
    params[:offset].nil? ? 0 : params[:offset].to_i
  end
end

