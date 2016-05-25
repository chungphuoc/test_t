class EnrollmentNotiMailer < ActionMailer::Base
  default from: 'admin@tone.com'
  def to_studio_book(enrollment)
    @enrollment = enrollment
    @studio = @enrollment.studio
    @customer = @enrollment.customer
    subject = 'New user book class'
    mail(to: @studio.email, subject: subject, template_name: 'to_studio_book')
  end

  def to_studio_cancel(enrollment)
    @enrollment = enrollment
    @studio = @enrollment.studio
    @customer = @enrollment.customer
    subject = 'User canceled class.'
    mail(to: @studio.email, subject: subject, template_name: 'to_studio_cancel')
  end

  def to_user_book(enrollment)
    @enrollment = enrollment
    @studio = @enrollment.studio
    @customer = @enrollment.customer
    subject = 'Book class confirmation.'
    mail(to: @customer.email, subject: subject, template_name: 'to_user_book')
  end

  def to_user_cancel(enrollment)
    @enrollment = enrollment
    @studio = @enrollment.studio
    @customer = @enrollment.customer
    subject = 'Cancel class confirmation.'
    mail(to: @customer.email, subject: subject, template_name: 'to_user_cancel')
  end
end
