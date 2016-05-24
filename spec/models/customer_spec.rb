require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_one :user }
  it { should have_many :enrollments }
  it { should have_many :courses_enrollments }
end
