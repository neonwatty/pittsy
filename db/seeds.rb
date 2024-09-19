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
  password_confirmation: "password"
)

# create a profile for the user
profile = user.profile || user.build_profile
profile.update!(
  first_name: "Robert",
  last_name: "Watt",
  role: "admin",
  status: 0,
  notes: "Rob is a great admin.",
  avatar: Rails.root.join("app/assets/images/avatars/avatar_1.png").open
)


user = User.where(email: "ben@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password",
)
profile = user.profile || user.build_profile
profile.update!(
 first_name: "Ben",
 last_name: "Schmidtetter",
 role: "employee",
 status: 1,
 notes: "Ben is a great employee.",
 avatar: Rails.root.join("app/assets/images/avatars/avatar_2.png").open
)


user = User.where(email: "josh@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password",
)
profile= user.profile || user.build_profile
profile.update!(
  role: "employee",
  first_name: "Josh",
  last_name: "Schmidtetter",
  status: 0,
  notes: "Josh is a great employee.",
  avatar: Rails.root.join("app/assets/images/avatars/avatar_3.png").open
)


user = User.where(email: "bob@gmail.com").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password",
)
profile = user.profile || user.build_profile
profile.update!(
  role: "employee",
  first_name: "Bob",
  last_name: "Androsik",
  status: 1,
  notes: "Bob is a great employee.",
  avatar: Rails.root.join("app/assets/images/avatars/avatar_4.png").open
)
