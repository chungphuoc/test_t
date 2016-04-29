class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :studio, :inverse_of => :user
  has_one :customer, :inverse_of => :user
  accepts_nested_attributes_for :studio
  accepts_nested_attributes_for :customer
end
