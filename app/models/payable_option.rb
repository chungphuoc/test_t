class PayableOption < ActiveRecord::Base
	before_save :default_currency
	belongs_to :studio

  def default_currency
    self.currency ||= 'Yen'
  end
end
