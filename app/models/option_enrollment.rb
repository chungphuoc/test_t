class OptionEnrollment < ActiveRecord::Base
	belongs_to :enrollment
	belongs_to :option, class_name: 'PayableOption'

	validates_uniqueness_of :enrollment_id, scope: [:option_id]
end
