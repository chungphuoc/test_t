require 'rails_helper'

RSpec.describe CourseStation, type: :model do
	it { should belong_to :course }
	it { should belong_to :station }
end
