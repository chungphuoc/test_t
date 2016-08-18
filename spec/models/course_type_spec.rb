require 'rails_helper'

RSpec.describe CourseType, type: :model do
  it { should belong_to :studio }
	it { should have_many :courses }
	it { should validate_presence_of :name }
	it { should validate_uniqueness_of(:name).scoped_to(:studio_id) }
end
