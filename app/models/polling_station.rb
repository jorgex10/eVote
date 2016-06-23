class PollingStation < ActiveRecord::Base
  has_one :member
  belongs_to :polling_process
  has_many :users

  scope :mine, -> { where(polling_process_id: PollingProcess.where(status: 1).first.id) }

  before_create :set_process

  def set_process
    self.polling_process = PollingProcess.where(status: 1).first
  end

end
