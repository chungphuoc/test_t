require 'rails_helper'

RSpec.describe OptionEnrollment, type: :model do
	it { should belong_to :enrollment }
	it { should belong_to(:option).class_name('PayableOption') }
end
