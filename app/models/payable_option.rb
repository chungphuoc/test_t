class PayableOption < ActiveRecord::Base
	before_save :default_currency
	belongs_to :studio

	validates :name, presence: true
	validates :price, presence: true
	
  def default_currency
    self.currency = 'JYP' if self.currency.blank?
  end
end
