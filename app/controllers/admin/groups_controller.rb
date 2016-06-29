class Admin::GroupsController < AdminController

  before_action :set_group, only: [:show, :edit, :update, :destroy, :add_member, :destroy_member]

  def index
    @groups = Group.mine
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.polling_process = current_process
    if @group.valid?
      @group.save
    else
      @status = @group.errors.full_messages.join('\n')
    end
  end

  def add_member
    voter = Voter.find group_params[:voters]
    voter.group = @group
    @status = voter.errors.full_messages.join('\n') unless voter.save
  end

  def destroy_member
    member = Voter.find params[:member]
    member.group = nil
    @status = member.errors.full_messages.join('\n') unless member.save
  end

  def show
  end

  def edit
  end

  def update
    @group.update(group_params)
    @status = @group.errors.full_messages.join('\n') unless @group.errors.empty?
  end

  def destroy
    @status = @group.errors.full_messages.join('\n') unless @group.destroy
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :voters)
  end

  def set_group
    @group = Group.find params[:id]
  end

end