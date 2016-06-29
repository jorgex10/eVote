class Admin::DatasetsController < AdminController
  def voters
    @voters = Voter.search_name(params[:query])
  end
end