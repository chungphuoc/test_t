class EnrollmentNotiMailer < ActionMailer::Base
  default from: "admin@tone.com"
  def book_class(enrollment)
    @enrollment = enrollment
    @studio = @enrollment.course.studio
    @customer = @enrollment.customer
    subject = "New user book class"
    mail(to: @studio.user.email, subject: subject, template_name: 'book_class')
  end
  def cancel_class(enrollment)
    @enrollment = enrollment
    @studio = @enrollment.course.studio
    @customer = @enrollment.customer
    subject = "User canceled class."
    mail(to: @studio.user.email, subject: subject, template_name: 'cancel_class')
  end
end
