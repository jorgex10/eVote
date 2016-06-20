class Admin::UsersController < AdminController
  def index
  	@members = Member.all
  	@voters = Voter.all
  end

end