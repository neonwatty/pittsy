class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  # Associations to profiles
  has_one :profile, dependent: :destroy

  # Associations to shifts
  has_many :shifts

  # Custom validations
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :password, presence: true, length: { minimum: 6, message: "must be at least 6 characters long" }
  validates :password_confirmation, presence: true
end
