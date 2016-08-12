require 'rails_helper'

RSpec.describe PayableOption, type: :model do
  it { should belong_to :studio }
  it { should have_many(:option_enrollments).with_foreign_key(:option_id) }
  it { should have_many(:enrollments).through(:option_enrollments) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_uniqueness_of(:name).case_insensitive.scoped_to(:studio_id) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
end
