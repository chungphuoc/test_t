require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :courses }
  it { should have_many :services }
  it { should have_many :studios }
end
