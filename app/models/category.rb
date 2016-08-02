class Category < ActiveRecord::Base
  before_save :downcase_name
  has_many :course_categories, dependent: :destroy
  has_many :courses, through: :course_categories, source: :course

  validates :name, presence: true, uniqueness: true

  def self.create_default
    Category.create(name: 'featured')
    Category.create(name: 'popular')
    Category.create(name: 'Event')
    Category.create(name: 'new')
  end

  def titleize_name
    name.titleize
  end

  private

  def downcase_name
    name.downcase!
  end
end
