class School < ActiveRecord::Base
	
	belongs_to :faculty

  has_many :polling_processes, dependent: :destroy

	validates :name, :faculty_id, presence: true

end
