class PayableOption < ActiveRecord::Base
	before_destroy :check_for_payments
	belongs_to :studio
	has_many :option_enrollments, foreign_key: :option_id
	has_many :enrollments, through: :option_enrollments

	validates :name, presence: true
	validates :price, presence: true
  
  def check_for_payments
  	if enrollments.any?
  		errors.add('Cannot delete option that has already been paid')
  		return false
  	end
  	return true
  end
end
