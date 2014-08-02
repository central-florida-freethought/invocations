class UserMeeting < ActiveRecord::Base
  belongs_to :user

  validates :meeting_time,
            :invocation_conducted,
            :pledge_before,
            :asked_to_stand,
            :speaker_preached,
            :speaker_praised,
            :user_id,
            presence: true
end
