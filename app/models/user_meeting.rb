class UserMeeting < ActiveRecord::Base
  include AASM
  
  aasm do
    state :pending, initial: true
    state :approved

    event :approve do
      transitions from: :pending, to: :approved
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
    if self.user.has_any_role? :trusted
      self.approve
    end
  end
end
    
