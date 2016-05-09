require 'rails_helper'

RSpec.describe Branch, type: :model do
  it { should belong_to :studio }
  it { should belong_to :station }
end
