require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should belong_to :teacher }
  it { should belong_to :station }
  it { should belong_to :exercise }
  it { should belong_to :studio }
  it { should have_many :enrollments }
  it { should have_many :customers }
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone_number }
  it { should ensure_length_of(:phone_number).is_at_least(10).is_at_most(12) }
  it { should allow_value('0909090909').for(:phone_number) }
  it { should_not allow_value('sometest').for(:phone_number) }
  it { should_not allow_value('12345678910111213').for(:phone_number) }
  it { should_not allow_value('123456789').for(:phone_number) }
  it { should validate_presence_of :num_slot }
  it { should validate_presence_of :start_date }
  it { should validate_presence_of :teacher }
  it { should validate_presence_of :station }
  it { should validate_presence_of :exercise }
  it { should allow_value(nil, '').for(:website) }
  it { should allow_value('http://google.com').for(:website) }
  it { should_not allow_value('wrong url').for(:website) }
end
