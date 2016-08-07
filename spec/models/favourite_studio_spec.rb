require 'rails_helper'

RSpec.describe FavouriteStudio, type: :model do
  it { should belong_to :customer }
  it { should belong_to :studio }
end
