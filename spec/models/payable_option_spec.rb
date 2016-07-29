require 'rails_helper'

RSpec.describe PayableOption, type: :model do
  it { should belong_to :studio }
  it { should have_many(:option_enrollments).with_foreign_key(:option_id) }
  it { should have_many(:enrollments).through(:option_enrollments) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :price }  
end
