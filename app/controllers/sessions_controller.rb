class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      render json: "Incorrect Credentials"
    else
      redirect_to user_path(user.id)
    end
  end

  def new
  end

end
