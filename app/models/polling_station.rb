class PollingStation < ActiveRecord::Base
  has_one :member
	belongs_to :polling_process
  has_many :users
end
