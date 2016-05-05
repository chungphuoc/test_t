class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  belongs_to :role, polymorphic: true
  has_one :studio, inverse_of: :user, dependent: :destroy
  has_one :customer, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :studio
  accepts_nested_attributes_for :customer
  #validates :name, presence: true, length: {in: 8..32}
  enum user_type: {admin: "Admin", studio: "Studio", customer: "Customer"}

  after_create do
    Signup.to_admin(self).deliver_later
  end

  def self.user_type
    [["Studio", :studio], ["Customer", :customer]]
  end

  def self.from_omniauth(auth)
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0,20]
    #   user.name = auth.info.name   # assuming the user model has a name
    #   #user.image = auth.info.image # assuming the user model has an image
    # end
    @user = User.find_by_provider_and_uid(auth.provider, auth.uid) || User.new
  end
end
