class SessionsController < ApplicationController

  def create

    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      login!(user)
      redirect_to user_path(user.id)
    else
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
