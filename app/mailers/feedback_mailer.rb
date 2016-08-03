class FeedbackMailer < ActionMailer::Base
  default from: 'admin@tone.com'

  def to_admin(username, email, message)
    @username = username
    @email = email
    @message = message
    subject = 'Feedback from user.'
    mail(to: Rails.application.secrets.admin_email,
         subject: subject,
         template_name: 'to_admin',
         content_type: 'multipart/alternative')
  end

  def from_customer_to_studio(customer, course, message)
    @customer = customer
    @studio = course.studio
    @course = course
    @message = message
    subject = "Feedback from customer #{@customer.name}"
    mail(to: @studio.email, subject: subject, template_name: 'to_studio')
  end
end
