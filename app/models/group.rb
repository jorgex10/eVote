class Group < ActiveRecord::Base

  belongs_to :polling_process
  has_many :voters
  validates :name, presence: true

  scope :mine, -> { where(polling_process_id: PollingProcess.where(status: 1).first.id) }

end
