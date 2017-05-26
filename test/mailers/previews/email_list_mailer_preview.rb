# Preview all emails at http://localhost:3000/rails/mailers/email_list_mailer
class MailerPreview < ActionMailer::Preview
  def sample_mail_preview
    Mailer.sample_email('peter.tascio@gmail.com')
  end
end
