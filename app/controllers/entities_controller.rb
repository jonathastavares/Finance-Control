class EntitiesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:assign_entity, :call_assign]
  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id
    if @entity.save
      assign_entity
      flash[:notice] = 'New transaction created!'
    else
      flash[:alert] = 'Something went wrong!'
    end
    redirect_to transactions_path
  end
  
  def assign_entity
    current_user.groups.each do |group|
      if params[group.name] && !group.entities.include?(@entity)
        @relation = Relation.create!(entity_id: @entity.id, group_id: group.id)
        @entity.group_id = @entity.groups[0].id
        @entity.save
        flash[:notice] = 'You have assigned this transaction!'
      else
        flash[:alert] = 'Something went wrong, please try again'
      end
    end
  end

  def index; end

  def destroy
    @entity = Entity.find(params[:entity_id])
    if @entity.creator.id == current_user.id && @entity.destroy
      flash[:notice] = 'You have deleted this transaction!'
    else
      flash[:alert] = 'Something went wrong, please try again'
    end
    redirect_to transactions_path
  end

  def assign
    @relation = Relation.new
    @entity = Entity.new
  end

  def call_assign
    @entity = Entity.find(params[:entity_id])
    assign_entity
    redirect_to transactions_path
  end

  def external_transactions; end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
