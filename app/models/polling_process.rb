class PollingProcess < ActiveRecord::Base
	validates :name, presence: true

  belongs_to :admin
  belongs_to :school

end
