require 'rails_helper'

RSpec.describe PayableOption, type: :model do
  it { should belong_to :studio }
end
