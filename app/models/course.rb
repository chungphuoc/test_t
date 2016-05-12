class Course < ActiveRecord::Base
  ratyrate_rateable "quality"
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
  validates :num_slot, presence: true
  validates :start_date, presence: true
  validates :teacher, presence: true
  validates :station, presence: true
  validates :exercise, presence: true
  validates :website, format: { with: Settings.regexp.url }, allow_blank: true

  delegate :name, to: :teacher, prefix: true
  delegate :location, to: :station, prefix: true
  delegate :name, to: :exercise, prefix: true

  def self.booked
    where(self.arel_table[:enrollments_count].gt(0))
  end

  def self.past
    where(self.arel_table[:start_date].lt(Time.zone.now))
  end
end
