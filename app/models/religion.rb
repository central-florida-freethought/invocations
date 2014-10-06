class Religion < ActiveRecord::Base
  has_many :speakers
  has_many :user_meetings, through: :speakers

  validates :name, presence: true
end

