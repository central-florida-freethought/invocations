class UserMeeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :locality
  belongs_to :speaker

  validates :meeting_type,
            :meeting_time,
            :invocation_conducted,
            :pledge_before,
            :asked_to_stand,
            :speaker_preached,
            :speaker_praised,
            :user,
            :locality,
            :speaker,
            presence: true
  validates_associated :speaker

  accepts_nested_attributes_for :speaker
end
