class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id
    if params[:group_id]
      group = Group.find(params[:group_id])
      @entity.groups << group
      group.entities << @entity
    end
    if @entity.save
      flash[:notice] = 'New transaction created!'
    else
      flash[:alert] = 'Something went wrong!'
    end
    redirect_to transactions_path
  end

  def index; end

  def destroy
    @entity = Entity.find(params[:entity_id])
    @entity.groups = []
    if @entity.creator.id == current_user.id && @entity.destroy
      flash[:notice] = 'You have deleted this transaction!'
    else
      flash[:alert] = 'Something went wrong, please try again'
    end
    redirect_to transactions_path
  end

  def assign
    @entity = Entity.find(params[:entity_id])
    return unless params[:id]
    group = Group.find(params[:id])
    @entity.groups << group
    group.entities << @entity
    if @entity.save && group.save
      flash[:notice] = 'You have assigned this transaction!'
    else
      flash[:alert] = 'Something went wrong, please try again'
    end
    redirect_to transactions_path
  end

  def external_transactions; end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
