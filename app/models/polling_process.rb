class PollingProcess < ActiveRecord::Base
	validates :name, presence: true

  belongs_to :admin
  belongs_to :school

  has_many :polling_stations
  has_many :users
  has_many :groups

end
