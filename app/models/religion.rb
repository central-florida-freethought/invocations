class Religion < ActiveRecord::Base
  has_many :speakers
  has_many :user_meetings, through: :speakers
  has_many :localities, through: :user_meetings

  validates :name, presence: true
end
