class Mailer < ApplicationMailer
  default from: "madlibsonrails@example.com"

  def sample_email(email)
    mail(to: email,
    subject: "Thank you for emailing MadlibsOnRails",
    template_path: 'mailer',
    template_name: 'sample_email')
  end
end
