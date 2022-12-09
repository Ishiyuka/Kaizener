# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |n|
  User.create!(name: "user#{n + 1}",
              department: "部署#{n + 1}",
              email: "test#{n + 1}@test.com",
              password: "password#{n + 1}",
              admin: false,
              )
end

User.create!(
  name: 'admin',
  department: '部署1',
  email: 'admin@example.com',
  admin: true,
  password: 'password',
  password_confirmation: 'password',
)

5.times do |n|
  Team.create!(name: "team#{n + 1}",
              )
end