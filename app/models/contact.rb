class Contact < ActiveRecord::Base
  has_many :localities

  validates :name,
            :title,
            :phone,
            :email,
            :street_address,
            :city,
            :state_code,
            :country_code,
            :zip,
            presence: true
end

