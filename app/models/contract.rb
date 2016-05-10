class Contract < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :studio

  delegate :name, to: :teacher, prefix: true
  accepts_nested_attributes_for :teacher
  validates_associated :teacher
  validates :teacher, uniqueness: true
  before_validation :find_teacher

  def find_teacher
    self.teacher = Teacher.where(name: teacher.name).first_or_initialize
  end
end
