require 'rails_helper'

RSpec.describe Station, type: :model do
  it { should validate_presence_of :location }
  it { should validate_uniqueness_of :location }
  it { should have_many(:courses).through(:course_stations) }
  it { should have_many :branches }
  it { should have_many :studios }
end
