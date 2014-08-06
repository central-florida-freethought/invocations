class UserMeetingsController < ApplicationController
  def index

  end

  def new
    @user_meeting = UserMeeting.new params[:user_meeting]
    @user_meeting.build_speaker
  end

  def create
    @user_meeting = UserMeeting.new user_meeting_params
    @user_meeting.user_id = current_user.id
    if @user_meeting.save
      redirect_to user_meetings_path, notice: t("user_meeting.created_successfully")
    else
      render :new
    end
  end

  private

  def user_meeting_params
    params.require(:user_meeting).permit!
  end
end
