class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :dni, :code, presence: true

  def full_name
  	"#{first_name} #{last_name}"
  end

  def debtor?
    self.pending_debt > 50
  end

  protected

  def email_required?
    true
  end

  def password_required?
    true unless self.type == "Member" or self.type == "Voter"
  end

end
