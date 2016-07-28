require 'rails_helper'

RSpec.describe FeaturedCourse, type: :model do
  it { should belong_to :course }
end
