class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :studio, inverse_of: :user, dependent: :destroy
  has_one :customer, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :studio
  accepts_nested_attributes_for :customer
  #validates :name, presence: true, length: {in: 8..32}
  enum user_type: {admin: "Admin", studio: "Studio", customer: "Customer"}

  def self.user_type
    [["Studio", :studio], ["Customer", :customer]]
  end
end
