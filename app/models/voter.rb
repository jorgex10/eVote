class Voter < User

	def self.import file
		CSV.foreach(file.path, headers: true) do |row|
			voter = (find_by_code(row["code"]) or Member.find_by_code(row["code"])) || new
			voter.attributes = row.to_hash
			voter.save! if voter.valid?
		end
	end

end