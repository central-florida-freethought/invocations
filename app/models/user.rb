class User < ActiveRecord::Base
  include RoleModel
  roles :user, :trusted, :admin

  # Store who activates/inactivates volunteers
  has_paper_trail only: [:approved]

  has_many :user_meetings
  after_initialize :set_default_role, if: :new_record?

  validates :first_name, :last_name, :phone_number, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  def set_default_role
    self.roles = :user
  end

  def admin!
    roles << :admin
    self.save!
  end

  def approve!
    update_attributes approved: true
  end

  def timeout_in
    30.minutes
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

