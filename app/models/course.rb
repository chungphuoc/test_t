class Course < ActiveRecord::Base
  paginates_per 9
  ratyrate_rateable 'quality'
  enum status: [:active, :inactive]
  mount_uploader :cover_img, ImageUploader
  belongs_to :teacher
  belongs_to :station
  belongs_to :exercise
  belongs_to :studio
  has_many :enrollments, dependent: :destroy
  has_many :customers, through: :enrollments
  has_many :course_categories, dependent: :destroy
  belongs_to :course_type

  validates :num_slot, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :kcal, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :tuition, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :start_date, presence: true
  validates :teacher, presence: true
  validates :station, presence: true
  validates :exercise, presence: true
  validates :course_type, presence: true
  # validate :start_must_be_before_end_time

  delegate :name, to: :course_type
  delegate :name, to: :teacher, prefix: true
  delegate :location, to: :station, prefix: true
  delegate :name, to: :exercise, prefix: true
  delegate :name, to: :station, prefix: true
  delegate :name, to: :studio, prefix: true
  delegate :stations, :teachers, :exercises, to: :studio
  delegate :options, to: :studio

  MAX_SCHEDULE = 2

  def self.booked
    where(arel_table[:enrollments_count].gt(0))
  end

  def self.past
    where(arel_table[:start_date].lt(Time.zone.now))
  end

  def waiting?(user)
    @enrollment = Enrollment.by_customer_and_course(user.role, self)
    @enrollment && @enrollment.waiting?
  end

  def slot_time
    days = []
    Course::MAX_SCHEDULE.times do |time|
      days += days_of_week.collect { |day| day + time * 7 }
    end
    newdays = days.collect do |day|
      newday = Date.today.beginning_of_week + day.days
      [newday.strftime('%a, %m-%d-%y'), newday] if Date.today.wday < day
    end
    newdays.compact
  end

  def full?(date)
    full_dates.include?(date)
  end

  def name_with_initial
    name
  end

  def self.search(params = {})
    results = all
    results = results.where(station_id: params[:station_ids]) if params[:station_ids]
    results = results.where(exercise_id: params[:exercise_ids]) if params[:exercise_ids]
    results = search_by_calories(results, params)
    results = search_by_time(results, params)
    results
  end

  def self.available(date)
    where.not('? = ANY(full_dates)', date)
  end

  def self.search_by_calories(courses, params = {})
    if params[:max_kcal] && params[:min_kcal]
      courses.where('kcal >= :min_kcal AND kcal <= :max_kcal',
                    min_kcal: params[:min_kcal],
                    max_kcal: params[:max_kcal])
    else
      courses
    end
  end

  def self.search_by_time(courses, params = {})
    if params[:min_time] && params[:max_time]
      courses.where('start_time >= :min_time AND start_time <= :max_time',
                    min_time: params[:min_time],
                    max_time: params[:max_time])
    else
      courses
    end
  end

  def feedback(customer, message)
    FeedbackMailer.from_customer_to_studio(customer, self, message).deliver_later
  end

  def is_booked(user)
    return false unless user.customer?
    enrollments.exists?(customer_id: user.role.id)
  end

  def self.find_course_by_category(category_name)
    category = Category.find_by(name: category_name.downcase)
    category.courses unless category.nil?
  end

  def open_slot
    num_slot - enrollments_count
  end

  private

  def start_must_be_before_end_time
    valid = start_time && end_time && start_time < end_time
    errors.add(:start_time, 'must be before end time') unless valid
  end
end
