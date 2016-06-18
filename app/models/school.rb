class School < ActiveRecord::Base
	
	belongs_to :faculty

	validates :name, :faculty_id, presence: true

end
