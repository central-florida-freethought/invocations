class Speaker < ActiveRecord::Base
  has_many :user_meetings
  belongs_to :organization
  belongs_to :religion
  belongs_to :denomination

  accepts_nested_attributes_for :organization
end

