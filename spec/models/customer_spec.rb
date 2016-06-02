require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_one :user }
  it { should have_many :enrollments }
  it { should have_many :courses_enrollments }
  it { should allow_value(10).for(:point) }
  it { should_not allow_value(-1).for(:point) }
  it { should allow_value(10).for(:total_point) }
  it { should_not allow_value(-1).for(:total_point) }
end
