class Admin::MembersController < AdminController
  def index
  	@members = Member.mine
  	@polling_stations_count = PollingStation.mine.count
  end

  def generate
  	begin
	  	PollingStation.mine.count.times do |index|
	  		ps = PollingStation.offset(index).first
		  	offset = rand(Voter.mine.count)
		  	rand_record = Voter.mine.offset(offset).first
		  	rand_record.update(type: "Member", polling_station_id: ps.id)
	  	end
  	rescue Exception => e
  		render js: "alert('<%= e %>')"
  	end
  end

end