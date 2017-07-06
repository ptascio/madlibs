class MailersController < ApplicationController

  def create
    debugger
    @email = params[:email]
    Mailer.sample_email(@email).deliver
  end

end
