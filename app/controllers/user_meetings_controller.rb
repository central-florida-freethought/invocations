class UserMeetingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index

  end

  def new
    @user_meeting = current_user.user_meetings.build params[:user_meeting]
    @user_meeting.build_speaker
    @localities = Locality.order :name
    @religions  = Religion.order :name
  end

  def create
    @user_meeting = current_user.user_meetings.build user_meeting_params
    if @user_meeting.save
      redirect_to user_meetings_path, notice: t("user_meeting.created_successfully")
    else
      render :new
    end
  end

  private

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
                   speaker_attributes: [:id,
                                        :name,
                                        :honorific,
                                        :organization_id,
                                        :religion_id,
                                        :denomination_id]
  end
end
