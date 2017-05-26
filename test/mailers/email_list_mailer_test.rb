require 'test_helper'

class EmailListMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  def sample_mail_preview
    EmailListMailer.sample_email('peter.tascio@gmail.com')
  end
end
