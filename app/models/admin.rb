class Admin < ActiveRecord::Base
  has_one :user, as: :role
  delegate :email, to: :user
  delegate :name, to: :user
end
