class UserMeeting < ActiveRecord::Base
  include AASM

  aasm do
    state :pending, initial: true
    state :approved
    state :denied
    state :reviewed

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :deny do
      transitions from: :pending, to: :denied
    end

    event :review do
      transitions from: :pending, to: :reviewed
    end
  end

  sifter :state_is do |meeting_state|
    aasm_state.eq meeting_state
  end

  before_create :check_user_role

  # store new version when any attribute is changed
  # see https://github.com/airblade/paper_trail for info
  has_paper_trail

  belongs_to :user
  belongs_to :locality
  belongs_to :speaker

  validates :meeting_type,
            :meeting_time,
            :invocation_conducted,
            :user,
            :locality,
            presence: true

  accepts_nested_attributes_for :speaker

  def check_user_role
    approve if user.has_role? :trusted
  end

  def send_approval_request
    MeetingMailer.approval_request(self, aasm.to_state.to_s).deliver_later
  end
end

