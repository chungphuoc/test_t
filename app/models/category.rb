class Category < ActiveRecord::Base
  before_create :downcase_name
  has_many :course_categories, dependent: :destroy
  has_many :courses, through: :course_categories, source: :course

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.create_default
    categories_name = ['featured', 'popular', 'Event', 'new']
    categories_name.each do | name |
      Category.create(name: name)
    end
  end

  def titleize_name
    name.titleize
  end

  private

  def downcase_name
    name.downcase!
  end
end
