class UsersController < ApplicationController
  before_action :authenticate, only: %i[edit update show destroy]
  skip_before_action :verify_authenticity_token, only: [:update]
  def new
    redirect_to root_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Finance Control #{@user.username}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_path if current_user.id != @user.id
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = 'Your account was updated successfully'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.destroy
      flash[:notice] = 'You have deleted your account!'
    else
      flash[:alert] = 'Something went wrong, please try again'
      redirect_to root_path
    end
  end

  private

  def authenticate
    redirect_to login_path unless logged_in?
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
