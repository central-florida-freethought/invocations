class UserMeetingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index

  end

  def new
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

    if @user_meeting.save
      redirect_to user_meetings_path, notice: get_flash(@user_meeting)
    else
      render :new
    end
  end

  private

  def get_flash(meeting)
    if meeting.pending?
      t("user_meeting.created_pending")
    else
      t("user_meeting.created_approved")
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
                   :speaker_praised,
                   :concerns,
                   :attachment,
                   :pending,
                   :street_address,
                   :minutes_url,
                   :agenda_url,
                   :media_url,
                   :user_id,
                   :locality_id,
                   speaker_attributes: [:id,
                                        :name,
                                        :honorific,
                                        :organization_id,
                                        :religion_id,
                                        :denomination_id]
  end
end
