class EnrollmentNotiMailer < ActionMailer::Base
  default from: 'admin@tone.com'
  def to_studio_book(enrollment)
    @enrollment = enrollment
    @studio = @enrollment.studio
    @customer = @enrollment.customer
    @course = @enrollment.course
    subject = 'New user book class'
    I18n.with_locale(I18n.locale) do
      mail(to: @studio.email, subject: subject, template_name: 'to_studio_book')
    end
  end

  def to_studio_cancel(enrollment)
    @enrollment = enrollment
    @studio = @enrollment.studio
    @customer = @enrollment.customer
    @course = @enrollment.course
    subject = 'User canceled class.'
    mail(to: @studio.email, subject: subject, template_name: 'to_studio_cancel')
  end

  def to_user_book(enrollment)
    @enrollment = enrollment
    @studio = @enrollment.studio
    @customer = @enrollment.customer
    @course = @enrollment.course
    subject = 'Book class confirmation.'
    I18n.with_locale(I18n.locale) do
      mail(to: @customer.email, subject: subject, template_name: 'to_user_book')
    end
  end

  def to_user_cancel(enrollment)
    @enrollment = enrollment
    @studio = @enrollment.studio
    @customer = @enrollment.customer
    @course = @enrollment.course
    subject = 'Cancel class confirmation.'
    mail(to: @customer.email, subject: subject, template_name: 'to_user_cancel')
  end
end
