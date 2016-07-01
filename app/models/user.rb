class User < ActiveRecord::Base
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :dni, :code, presence: true

  before_create :set_attributes

  belongs_to :polling_station
  belongs_to :polling_process

  def full_name
  	"#{first_name} #{last_name}"
  end

  def debtor?
    self.pending_debt > 50
  end

  def set_attributes
    self.school_id = School.first.id
    self.polling_process = PollingProcess.where(status: 1).first
  end

  protected

  def email_required?
    true
  end

  def password_required?
    true unless self.type == "Member" or self.type == "Voter"
  end

end
