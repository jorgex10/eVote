class Admin::GroupsController < AdminController

  before_action :set_group, only: [:edit, :update]

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

  def edit
  end

  def update
    @group.update(group_params)
    @status = @group.errors.full_messages.join('\n') unless @group.errors.empty?
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def set_group
    @group = Group.find params[:id]
  end

end