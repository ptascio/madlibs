class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      render json: "Incorrect Credentials"
    else
      login!(user)
      redirect_to user_path(user.id)
    end
  end

  def new
  end

  def show
  end

  def destroy
    logout!
    redirect_to session_url
  end

end
