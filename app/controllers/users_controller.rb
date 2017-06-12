class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]

  def create
    if (params[:confirm_password] == params[:user][:password])
      @user = User.new(user_params)
    end

    if @user.save
      login!(@user)
      render "show"
    else
      redirect_to new_user_path, :flash => { :error => "*Ensure all fields are populated
        and that passwords match." }
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

  def update
    @user = User.find(params[:id])
    if current_user.is_password?(params[:user][:password])
      if params[:user][:username].length > 0
        current_user.change_username(params[:user][:username])
        render 'show'
      else
        redirect_to user_path(current_user), :flash => { :error => "Username field must be filled in." }
      end
    else
      redirect_to user_path(current_user), :flash => { :error => "We could not verify access to this account." }
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
