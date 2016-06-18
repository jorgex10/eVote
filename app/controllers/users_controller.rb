class UsersController < ApplicationController
  def index
  	@members = Member.all
  	@voters = Voter.all
  end

end