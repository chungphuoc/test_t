require 'rails_helper'

RSpec.describe CourseCategory, type: :model do
  it { should belong_to :course }
  it { should belong_to :category}
  it { should validate_presence_of :course_id}
  it { should validate_presence_of :category_id}
end
