class Locality < ActiveRecord::Base
  has_many :user_meetings

  validates :name,
            :phone_number,
            :street_address,
            :city,
            :state_code,
            :country_code,
            :zip,
            :invocations_conducted,
            presence: true
  validates :volunteer_needed, inclusion: { in: [true, false] }
end

