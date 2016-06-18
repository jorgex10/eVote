class MembersController < ApplicationController
  def index
  	@members = Member.all
  	@polling_stations_count = PollingStation.count
  end

  def generate
  	begin
	  	PollingStation.count.times do |index|
	  		ps = PollingStation.offset(index).first
		  	offset = rand(Voter.count)
		  	rand_record = Voter.offset(offset).first
		  	rand_record.update(type: "Member", polling_station_id: ps.id)
	  	end
  	rescue Exception => e
  		render js: "alert('<%= e %>')"
  	end
  end

end