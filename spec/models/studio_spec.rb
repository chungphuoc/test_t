require 'rails_helper'

RSpec.describe Studio, type: :model do
  it { should have_one :user }
  it { should have_many :courses }
  it { should have_many :contracts }
  it { should have_many :teachers }
  it { should have_many :branches }
  it { should have_many :stations }
  it { should have_many :services }
  it { should have_many :exercises }
end
