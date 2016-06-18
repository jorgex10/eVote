class Faculty < ActiveRecord::Base
	
	has_many :schools, dependent: :destroy

	validates :name, presence: true

end
