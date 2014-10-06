class Locality < ActiveRecord::Base
  has_many :user_meetings

  validates :name,
            :phone_number,
            :street_address,
            :city,
            :state_code,
            :country_code,
            :zip,
            :volunteer_needed,
            :invocations_conducted,
            presence: true
end

