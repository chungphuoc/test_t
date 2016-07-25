class PayableOption < ActiveRecord::Base
	before_save :default_currency
	before_destroy 
	belongs_to :studio
	has_many :enrollments, through: :option_enrollments

	validates :name, presence: true
	validates :price, presence: true
	
	def default_currency
    self.currency = 'JPY' if self.currency.blank?
 	end	

  def check_for_payments
  	if enrollments.any?
  		errors.add('Cannot delete option that has already been paid')
  		return false
  	end
  end
end
