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

  validates :name, presence: true
  validates :phone_number, presence: true,
                           format: { with: Settings.regexp.phone },
                           length: { minimum: 10, maximum: 12 }
  validates :num_slot, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :kcal, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :tuition, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :start_date, presence: true
  validates :teacher, presence: true
  validates :station, presence: true
  validates :exercise, presence: true
  validates :website, format: { with: Settings.regexp.url }, allow_blank: true
  validate :must_have_days_of_week 

  delegate :name, to: :teacher, prefix: true
  delegate :location, to: :station, prefix: true
  delegate :name, to: :exercise, prefix: true
  delegate :name, to: :station, prefix: true
  delegate :name, to: :studio, prefix: true
  delegate :stations, :teachers, :exercises, to: :studio

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
      if Date.today.wday < day
        [newday.strftime('%a, %m-%d-%y'), newday]
      end
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
    results
  end

  def self.available(date)
    where.not('? = ANY(full_dates)', date)
  end

  def must_have_days_of_week
    errors.add(:days_of_week, 'Must choose at least one day.') unless days_of_week.any?
  end
end
