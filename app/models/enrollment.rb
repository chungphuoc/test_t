class Enrollment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :course, counter_cache: true
  validates_uniqueness_of :customer_id, scope: [:course_id], message: 'Class has been booked!'
  delegate :studio, to: :course

  enum status: [:waiting, :paid, :cancel, :passed]
  STATUS = %w(Waiting Paid Cancel Passed).freeze
  STATUS_CANCEL = 2
  after_create :book_class_mailer
  before_create do
    self.status = :waiting
  end

  def change_status(status)
    cancel_class_mailer(self) if update_attributes(status: status)
  end

  def cancel?
    self['status'] && self['status'] == Enrollment::STATUS_CANCEL
  end

  def book_class_mailer
    EnrollmentNotiMailer.book_class(self).deliver_later
  end

  def cancel_class_mailer
    EnrollmentNotiMailer.cancel_class(self).deliver_later
  end
end
