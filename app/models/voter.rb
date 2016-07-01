class Voter < User

  belongs_to :group

  scope :mine, -> { where(polling_process_id: PollingProcess.where(status: 1).first.id) }
  scope :no_members, -> { where(group: nil) }
  scope :without_ps, -> { where(polling_station_id: nil) }

  def self.import file
    CSV.foreach(file.path, headers: true) do |row|
      voter = (find_by_code(row["code"]) or Member.find_by_code(row["code"])) || new
      voter.attributes = row.to_hash
      voter.save! if voter.valid?
    end

    # CSV.foreach(file.path, headers: true) do |row|
    #   voter = (find_by_code(row["code"]) or Member.find_by_code(row["code"]))
    #   if voter.nil?
    #     voter = Voter.new
    #   else
    #     unless voter.polling_process == PollingProcess.where(status: 1).first
    #       voter = voter.dup
    #     end
    #   end
    #   p '+++++++++++++++++++++++++++++++++++++++++'
    #   p voter.valid?
    #   p voter.errors.full_messages
    #   p '+++++++++++++++++++++++++++++++++++++++++'
    #   voter.attributes = row.to_hash
    #   voter.save if voter.valid?
    # end

  end

  def self.search_name query
    if query
      where('first_name || last_name ILIKE ?', "%#{query}%")
    else
      all
    end
  end

end
