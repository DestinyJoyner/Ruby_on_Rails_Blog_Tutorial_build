# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# run seed file -> rails db:seed
user =User.where(email: "test@test.com").find_or_initialize_by(email: "test@test.com")
user.update!(password: "password", password_confirmation: "password")

# need loop to create about 100 blog posts
# 100.times do |i|
#     BlogPost.create!(
#         title: "Blog Post #{i}",
#         content: "This is the content of blog post #{i}"
#     )
# end