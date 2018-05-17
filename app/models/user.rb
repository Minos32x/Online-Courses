class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def password_required?
    new_record? ? false : super
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: { male: 0, female: 1, other: 2 }

  acts_as_voter
  has_many :courses, dependent: :destroy
  has_many :lectures, dependent: :destroy

  validates :name, presence: { message: 'Name Should Be Filled' }
  validates :email, presence: { message: 'Email Should Be Filled' }
  validates :gender, presence: { message: 'Gender Should Be Selected' }
  validates :date_of_birth, presence: { message: 'Date Should Be Filled' }
  validates :avatar, presence: { message: 'Avatar Should Be Selected' }

  mount_uploader :avatar, AvatarUploader
  acts_as_voter
end
