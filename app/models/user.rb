class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  mount_uploader :avatar, ImageUploader
  validates :password, :presence => true, :on => :create
  validates :password_confirmation, :presence => true, :on => :create
  belongs_to :role, polymorphic: true
  delegate :enrollments, to: :role

  delegate :enrollments, to: :role, allow_nil: true

  after_create do
    Signup.to_admin(self).deliver_later
  end

  def self.user_type
    [["Studio", :studio], ["Customer", :customer]]
  end

  def customer?
    self.role_type == "Customer"
  end

  def studio?
    self.role_type == "Studio"
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

  def studio?
    role_type == 'Studio'
  end
end
