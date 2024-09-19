# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.where(email: "neonwatty@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password",
  role: "admin",
  first_name: "Jeremy",
  last_name: "Watt",
  status: 0,
  avatar: Rails.root.join("app/assets/images/avatars/avatar_1.jpg").open
)

user = User.where(email: "jermwatt@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password",
  role: "employee",
  first_name: "Rubber",
  last_name: "Ducky",
  status: 0,
  avatar: Rails.root.join("app/assets/images/avatars/avatar_2.jpg").open
)
