class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  # Associations - active storage
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ], preprocessed: true
  end

  # validates role
  validates :role, inclusion: { in: %w[admin employee] }

  # status range validation - 0: inactive, 1: active
  validates :status, inclusion: { in: [ 0, 1 ] }

  # Custom validations for email and password fields
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :first_name, presence: true, length: { minimum: 3, message: "must be at least 3 characters long" }
  validates :last_name, presence: true, length: { minimum: 3, message: "must be at least 3 characters long" }
  validates :password, presence: true, length: { minimum: 3, message: "must be at least 3 characters long" }
  validates :password_confirmation, presence: true

  # Custom methods for role
  def admin?
    role == "admin"
  end

  def employee?
    role == "employee"
  end
end
