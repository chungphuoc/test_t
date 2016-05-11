class Contract < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :studio

  validates_associated :teacher
  validates :teacher, uniqueness: true

  accepts_nested_attributes_for :teacher

  before_validation :find_teacher

  delegate :name, to: :teacher, prefix: true

  def find_teacher
    self.teacher = Teacher.where(name: teacher.name).first_or_initialize
  end
end
