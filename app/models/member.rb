class Member < User

  belongs_to :polling_station

  scope :mine, -> { where(polling_process_id: PollingProcess.where(status: 1).first.id) }

end