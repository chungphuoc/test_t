class Signup < ActionMailer::Base
  default from: 'admin@tone.com'
  content_type 'multipart/alternative'
  def to_admin(user)
    @user = user
    subject = 'New user signup'
    mail(to: Rails.application.secrets.admin_email, subject: subject, template_name: 'to_admin')
  end
end
