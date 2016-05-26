class FeedbackMailer < ActionMailer::Base
  default from: 'admin@tone.com'

  def to_admin(username, title, message)
    @user_name = username
    @title = title
    @message = message
    subject = 'Feedback from user.'
    mail(to: Rails.application.secrets.admin_email, subject: subject, template_name: 'to_admin')
  end
end
