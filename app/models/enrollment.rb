class Enrollment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :course, counter_cache: true
  validates_uniqueness_of :customer_id, scope: [:course_id], message: 'Class has been booked!'
  validates_uniqueness_of :customer_id, scope: [:course_id, :join_date], message: 'Class has been booked!'
  validate :num_slot_less_than_maximum

  delegate :studio, to: :course
  delegate :name, to: :course
  delegate :kcal, to: :course
  delegate :name, to: :course, prefix: true
  delegate :cover_img, :start_date, :start_time, :end_time, to: :course

  enum status: [:paid, :cancel, :passed]
  STATUS = %w(Paid Canceled Passed).freeze
  
  after_create :book_class_mailer
  before_create do
    self.status = :paid
  end

  def num_slot_less_than_maximum
    @course = self.course
    @enrollment_count = @course.enrollments.where(join_date: self.join_date).count
    if @enrollment_count >= @course.num_slot
      errors.add("This class is full! Please choose another time.")
    end
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
  def self.update_status
    #Enrollment.where("status = ? AND join_date < ?", Enrollment.statuses[:paid], Date.tomorrow).update_all(status: :passed)
    Course.first.update_attributes(num_slot: 1001)
    Rails.logger.info("Update status at #{Time.now}")
  end
end
