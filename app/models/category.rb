class Category < ActiveRecord::Base
  before_save :downcase_name
  has_many :course_categories, dependent: :destroy
  has_many :courses, through: :course_categories, source: :course

  validates :name, presence: true, uniqueness: true

  def self.create_default
    Category.create(name: 'featured courses')
    Category.create(name: 'popular courses')
    Category.create(name: 'Event courses')
    Category.create(name: 'new courses')
  end

  def titleize_name
    self.name.titleize
  end

  private

  def downcase_name
    self.name.downcase!
  end
end
