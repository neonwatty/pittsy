class Profile < ApplicationRecord
  belongs_to :user
  before_save :set_default_avatar

  validates :role, presence: true, inclusion: { in: %w[admin employee] }
  validates :status, presence: true, inclusion: { in: [ 0, 1 ] }
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :notes, length: { maximum: 255 }

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ], preprocessed: true
  end

  # Custom methods for full name
  def full_name
    "#{first_name} #{last_name}"
  end

  # Custom methods for role
  def admin?
    role == "admin"
  end

  def employee?
    role == "employee"
  end
end

private

def set_default_avatar
  unless avatar.attached?
    avatar.attach(io: File.open(Rails.root.join("app/assets/images/avatars/blank.jpg")), filename: "blank.jpg", content_type: "image/jpg")
  end
end

def avatar_attached?
  avatar.attached?
end
