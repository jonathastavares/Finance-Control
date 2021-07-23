class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      flash[:notice] = "New transaction created!"
      redirect_to groups_path
    else
      flash[:alert] = "Something went wrong!"
      redirect_to groups_path
    end
  end

  def transactions
    @group = Group.find(params[:id])
  end

  def index
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end