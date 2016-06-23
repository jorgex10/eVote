class Admin < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :dni, :code, presence: true

  has_many :polling_processes

  def full_name
    "#{first_name} #{last_name}"
  end

end