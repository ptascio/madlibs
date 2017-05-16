class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      render "show"
    else
      render json: @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
