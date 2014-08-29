class Locality < ActiveRecord::Base
  has_many :user_meetings
  belongs_to :contact
  has_many :religions, through: :user_meetings

  validates :name,
            :street_address,
            :city,
            :state_code,
            :country_code,
            :zip,
            :volunteer_needed,
            :invocations_conducted,
            :contact,
            presence: true

  validates_associated :contact

  accepts_nested_attributes_for :contact
end
