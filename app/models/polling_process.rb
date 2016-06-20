class PollingProcess < ActiveRecord::Base
	validates :name, presence: true
end
