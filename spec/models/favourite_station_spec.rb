require 'rails_helper'

RSpec.describe FavouriteStation, type: :model do
  it { should belong_to :customer }
  it { should belong_to :station }
end
