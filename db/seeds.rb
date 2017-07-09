# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  u = User.create(name: Faker::Name.name, email: "example#{i}@example.com", password: "password", password_confirmation: "password")
end

User.all.each do |u|
  3.times do
    u.posts.create(name: Faker::HarryPotter.location, body: Faker::HarryPotter.quote)
  end
end
