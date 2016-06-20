class Admin::VotersController < AdminController
  def index
  	@voters = Voter.all.sort_by{|x| x.code}
  end

  def import
  	if params[:file]
			Voter.import(params[:file])
			redirect_to admin_voters_path
		else
			redirect_to admin_voters_path
		end
  end

end
