class MailersController < ApplicationController

  def create
    @email = params[:email]
    Mailer.sample_email(@email).deliver
  end

end
