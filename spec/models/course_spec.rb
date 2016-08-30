require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should belong_to :teacher }
  it { should have_many :course_stations }
  it { should have_many(:stations).through(:course_stations) }
  it { should belong_to :exercise }
  it { should belong_to :studio }
  it { should have_many :enrollments }
  it { should have_many :customers }
  it { should belong_to :course_type }
  it { should allow_value(10).for(:kcal) }
  it { should_not allow_value(-1).for(:kcal) }
  it { should validate_presence_of :num_slot }
  it { should validate_presence_of :start_date }
  it { should validate_presence_of :teacher }
  it { should validate_presence_of :stations }
  it { should validate_presence_of :exercise }
end
