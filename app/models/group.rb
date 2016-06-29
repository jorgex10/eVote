class Group < ActiveRecord::Base

  belongs_to :polling_process
  has_many :voters
  
  validates :name, presence: true

  before_destroy :destroy_members

  scope :mine, -> { where(polling_process_id: PollingProcess.where(status: 1).first.id) }

  def destroy_members
  	unless self.voters.blank?
  		self.voters.each do |member|
  			member.update(group_id: nil)
  		end
  	end
  end

end
