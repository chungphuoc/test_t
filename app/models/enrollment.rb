class Enrollment < ActiveRecord::Base
  paginates_per 12
  belongs_to :customer
  belongs_to :course, counter_cache: true
  has_many :option_enrollments
  has_many :options, class_name: 'PayableOption', through: :option_enrollments

  validates_uniqueness_of :customer_id, scope: [:course_id, :join_date], message: 'Class has been booked!'
  validate :course_is_open, on: :create
  validate :num_slot_less_than_maximum, on: :create
  validate :pay_by_points, on: :create

  delegate :studio, to: :course
  delegate :name, to: :course
  delegate :kcal, to: :course
  delegate :name, to: :course, prefix: true
  delegate :name, to: :customer, prefix: true
  delegate :cover_img, :start_date, :start_time, :end_time, to: :course

  enum status: [:paid, :cancel, :passed]
  STATUS = %w(Paid Canceled Passed).freeze
  VALID_CANCEL_HOUR = 2

  after_create :book_class_mailer
  before_create do
    self.status = :paid
  end

  after_save :update_course_full_dates

  def num_slot_less_than_maximum
    @course = course
    @enrollment_count = @course.enrollments.where(join_date: join_date).count
    errors.add('This class is full! Please choose another time.') if @enrollment_count >= @course.num_slot
  end

  def course_is_open
    @course = course
    errors.add(:course_id, ': This course is not open.') if @course.inactive?
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

  def update_course_full_dates
    if course.enrollments.where.not(status: Enrollment.statuses[:cancel]).where(join_date: join_date).count >= course.num_slot
      course.full_dates << join_date
    else
      course.full_dates.delete(join_date)
    end
    course.save
  end

  def self.by_customer_and_course(customer, course)
    Enrollment.find_by_customer_id_and_course_id(customer, course)
  end

  def self.update_status
    Enrollment.where('status = ? AND join_date < ?',
                     Enrollment.statuses[:paid],
                     Date.tomorrow).update_all(status: :passed)
    Rails.logger.info("Update status at #{Time.now}")
  end

  def can_cancel?
    join_date = self.join_date.to_datetime + self.course.start_time.seconds_since_midnight.seconds
    if join_date.to_f - DateTime.now.to_f > Enrollment::VALID_CANCEL_HOUR.hour
      return true
    end
    false
  end

  def total_cost
    course.tuition + options.inject(0) { |a, e| a + e.price } - paid_points
  end

  def self.find_enrollment_by_month(month_year = {}, studio = nil)
    month = month_year[:month]
    year = month_year[:year]
    return nil if month.nil? || year.nil?
    result = nil
    if month.to_i == 0
      result = Enrollment.where('extract(year from enrollments.created_at) = ?', year)
    else
      result = Enrollment.where(
        'extract(year from enrollments.created_at) = ? AND extract(month from enrollments.created_at) = ?',
        year,
        month
      )
    end
    unless studio.nil?
      result = result.joins(:course).where('courses.studio_id = ?', studio.id)
    end
    result
  end

  def self.find_enrollment_by_year(year = nil, studio = nil)
    return nil if year.nil?
    if studio.nil?
      Enrollment.where('extract(year from created_at) = ?', year)
    else
      studio.enrollments.where('extract(year from created_at) = ?', year)
    end
  end

  def pay_by_points
    if (customer.point - paid_points) < 0
      errors.add(:course_id, 'Invalid point of payment.')
    else
      new_points = customer.point - paid_points
      customer.update_attributes(point: new_points)
    end
  end
end
