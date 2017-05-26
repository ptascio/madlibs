class MailersController < ApplicationController

  def create
    @email = params[:email]
    Mailer.sample_email(@email).deliver_now
  end

end
