class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable
  mount_uploader :avatar, ImageUploader
  ratyrate_rater
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :contact_number, format: { with: Settings.regexp.phone },
                             length: { minimum: 10, maximum: 12 },
                             on: :update
  validates :address, length: { minimum: 20, maximum: 120 }, on: :update
  validates :name, length: { minimum: 3, maximum: 60 }
  belongs_to :role, polymorphic: true
  delegate :enrollments, to: :role
  delegate :favourite_courses, to: :role
  delegate :courses_favourites, to: :role
  delegate :courses_enrollments, to: :role
  delegate :point, to: :role
  delegate :enrollments, to: :role, allow_nil: true

  after_create do
    Signup.to_admin(self).deliver_later
  end

  def self.user_type
    [['Studio', :studio], ['Customer', :customer]]
  end

  def customer?
    role_type == 'Customer'
  end

  def studio?
    role_type == 'Studio'
  end

  def admin?
    role_type == 'Admin'
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
