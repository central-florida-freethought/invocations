class UserMeetingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    if current_user.has_any_role? :admin
      @user_meetings = UserMeeting.pending
    else
      @user_meetings = current_user.user_meetings
    end
  end

  def new
    if params[:locality_id] == nil
      redirect_to localities_path, alert: "Please choose a locality"
    end
    @user_meeting = current_user.user_meetings.build params[:user_meeting]
    @user_meeting.build_speaker
  end

  def create
    @user_meeting = current_user.user_meetings.build user_meeting_params
    if current_user.has_any_role? :trusted
      @user_meeting.pending = false
    else
      @user_meeting.pending = true
    end
    
    @user_meeting.speaker = find_or_create_speaker

    if @user_meeting.save
      redirect_to user_meetings_path, notice: get_flash(@user_meeting)
    else
      render :new
    end
  end

  private
  
  def find_or_create_speaker
    Speaker.find_by(name: user_meeting_params[:speaker_attributes][:name]) || Speaker.new(user_meeting_params[:speaker_attributes])
  end

  def get_flash(meeting)
    if meeting.pending?
      t("user_meeting.created_pending")
    else
      t("user_meeting.created_approved")
    end
  end

  def report
    @user_meeting = UserMeeting.all
    respond_to do |format|
      format.json { render json: @user_meeting}
    end
  end

  def user_meeting_params
    params.require(:user_meeting).
            permit :id,
                   :meeting_type,
                   :meeting_time,
                   :invocation_conducted,
                   :pledge_before,
                   :asked_to_stand,
                   :speaker_preached,
                   :speaker_preached_explanation,
                   :speaker_praised,
                   :speaker_praised_explanation,
                   :concerns,
                   :attachment,
                   :pending,
                   :street_address,
                   :minutes_url,
                   :agenda_url,
                   :media_url,
                   :user_id,
                   :locality_id,
                   speaker_attributes: [:id, :name, :honorific, :religion_id, 
                     :denomination_id, organization_attributes: [:id, :name]]
  end
end
