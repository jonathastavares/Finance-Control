class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id
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
    if @entity.destroy
      flash[:notice] = 'You have deleted this transaction!'
    else
      flash[:alert] = 'Something went wrong, please try again'
    end
    redirect_to transactions_path
  end

  def assign
    @entity = Entity.find(params[:entity_id])
    return unless params[:id]

    @entity.group_id = params[:id]
    if @entity.save
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
