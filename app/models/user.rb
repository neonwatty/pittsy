class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  # validates role
  validates :role, inclusion: { in: %w[admin employee] }

  # Custom validations for email and password fields
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
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
