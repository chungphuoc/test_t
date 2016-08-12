class PayableOption < ActiveRecord::Base
  before_destroy :check_for_payments
  before_save :downcase_name
  belongs_to :studio
  has_many :option_enrollments, foreign_key: :option_id
  has_many :enrollments, through: :option_enrollments

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: [:studio_id] }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def check_for_payments
    if enrollments.any?
      errors.add('Cannot delete option that has already been paid')
      return false
    end
    true
  end

  def downcase_name
    name.downcase!
  end
end
