require 'rails_helper'

RSpec.describe PayableOption, type: :model do
  it { should belong_to :studio }
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }  
end
