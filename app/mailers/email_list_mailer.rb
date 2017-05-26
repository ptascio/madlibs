class EmailListMailer < ApplicationMailer
  default from: "madlibsonrails@example.com"

  def sample_email(email)
    mail(to: email, subject: "Thank you for signing up")
  end
end
