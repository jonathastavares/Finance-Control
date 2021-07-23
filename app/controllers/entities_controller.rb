class EntitiesController < ApplicationController
  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id
    if @entity.save
      flash[:notice] = "New entity created!"
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong!"
      redirect_to root_path
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
