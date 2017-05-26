class Mailer < ApplicationMailer
  default from: "madlibsonrails@example.com"

  def sample_email(email)
    mail(to: "peter.tascio@gmail.com", subject: "Thank you for signing up")
  end
end
