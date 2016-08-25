require 'rails_helper'

RSpec.describe Term, type: :model do
  it { should validate_presence_of :content }
  it { should define_enum_for :user_type }
end
