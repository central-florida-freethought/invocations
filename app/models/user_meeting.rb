class UserMeeting < ActiveRecord::Base

  # store new version when any attribute is changed
  # see https://github.com/airblade/paper_trail for info
  has_paper_trail

  scope :pending, -> {where pending: true}
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
