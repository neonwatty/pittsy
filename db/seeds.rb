# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.where(email: "rob@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password",
  role: "admin",
  first_name: "Robert",
  last_name: "Watt",
  status: 0,
  avatar: Rails.root.join("app/assets/images/avatars/avatar_1.png").open
)

user = User.where(email: "ben@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password",
  role: "employee",
  first_name: "Ben",
  last_name: "Schmidtetter",
  status: 1,
  avatar: Rails.root.join("app/assets/images/avatars/avatar_2.png").open
)

user = User.where(email: "josh@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password",
  role: "employee",
  first_name: "Josh",
  last_name: "Schmidtetter",
  status: 1,
  avatar: Rails.root.join("app/assets/images/avatars/avatar_3.png").open
)

user = User.where(email: "bob@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password",
  role: "employee",
  first_name: "Bob",
  last_name: "Androsik",
  status: 1,
  avatar: Rails.root.join("app/assets/images/avatars/avatar_4.png").open
)
