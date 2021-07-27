class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      flash[:notice] = 'New transaction created!'
    else
      flash[:alert] = 'Something went wrong!'
    end
    redirect_to groups_path
  end

  def transactions
    @group = Group.find(params[:id])
  end

  def index; end

  def destroy
    @group = Group.find(params[:group_id])
    @group.entities = []
    if @group.creator.id == current_user.id && @group.destroy
      flash[:notice] = 'Group deleted successfully!'
    else
      flash[:alert] = 'Something went wrong!'
    end
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
