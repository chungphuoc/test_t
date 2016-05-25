class Enrollment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :course, counter_cache: true
  validates_uniqueness_of :customer_id, scope: [:course_id], message: 'Class has been booked!'
  delegate :studio, to: :course
  delegate :name, to: :course
  delegate :kcal, to: :course

  enum status: [:waiting, :paid, :cancel, :passed]
  STATUS = %w(Waiting Paid Canceled Passed).freeze
  STATUS_WAITING = 0
  STATUS_PAID = 1
  STATUS_CANCEL = 2
  after_create :book_class_mailer
  before_create do
    self.status = :waiting
  end

  def change_status(status)
    cancel_class_mailer if update_attributes(status: status)
  end

  def book_class_mailer
    EnrollmentNotiMailer.to_studio_book(self).deliver_later
    EnrollmentNotiMailer.to_user_book(self).deliver_later
  end

  def cancel_class_mailer
    EnrollmentNotiMailer.to_studio_cancel(self).deliver_later
    EnrollmentNotiMailer.to_user_cancel(self).deliver_later
  end

  def self.by_customer_and_course(customer, course)
    Enrollment.find_by_customer_id_and_course_id(customer, course)
  end
end
