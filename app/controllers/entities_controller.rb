class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id
    if @entity.save
      flash[:notice] = "New transaction created!"
      redirect_to transactions_path
    else
      flash[:alert] = "Something went wrong!"
      redirect_to transactions_path
    end
  end

  def index
  end

  def destroy
    @entity = Entity.find(params[:entity_id])
    if @entity.destroy
      flash[:notice] = 'You have deleted this transaction!'
      redirect_to transactions_path
    else
      flash[:alert] = 'Something went wrong, please try again'
      redirect_to transactions_path
    end
  end

  def assign
    @entity = Entity.find(params[:entity_id])
    unless !params[:id]
      @entity.group_id = params[:id]
      if @entity.save
        flash[:notice] = 'You have assigned this transaction!'
        redirect_to transactions_path
      else
        flash[:alert] = 'Something went wrong, please try again'
        redirect_to transactions_path
      end
    end
  end

  def external_transactions
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
