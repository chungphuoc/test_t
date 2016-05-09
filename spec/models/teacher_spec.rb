require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :courses }
  it { should have_many :contracts }
  it { should have_many :studios }
end
