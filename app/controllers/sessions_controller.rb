class SessionsController < ApplicationController

  def create

    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      login!(user)
      redirect_to root_path
    elsif (params[:user][:username].length < 1 || params[:user][:password].length < 1)
      redirect_to session_path, :flash => { :error => "Make sure both Username and Password are filled in." }
      return
    else
      user = User.find_by_credentials(
        params[:user][:username],
        params[:user][:password]
        )

      if user.nil?
        # render json: "Incorrect Credentials"
        redirect_to session_path, :flash => { :error => "Sorry, we could not find this account." }
      else
        login!(user)
        redirect_to root_path
      end
    end
  end

  def new
  end

  def show
  end

  def destroy
    logout!
    redirect_to root_path
  end

end
