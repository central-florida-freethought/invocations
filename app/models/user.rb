class User < ActiveRecord::Base
  has_many :user_meetings
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  validates :first_name, :last_name, :phone_number, presence: true

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
