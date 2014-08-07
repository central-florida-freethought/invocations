class Organization < ActiveRecord::Base
  has_many :speakers

  validates :name, presence: true
end
