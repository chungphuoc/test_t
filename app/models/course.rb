class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :station
  belongs_to :exercise
  belongs_to :studio
  has_many :enrollments, dependent: :destroy
  has_many :customers, through: :enrollments

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :num_slot, presence: true
  validates :start_date, presence: true
  validates :teacher, presence: true
  validates :station, presence: true
  validates :exercise, presence: true
  validates :website, format: { with: /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix }, allow_blank: true
end
