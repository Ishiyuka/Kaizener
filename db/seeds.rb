# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 5.times do |n|
#   User.create!(name: "user#{n + 1}",
#               department: "部署#{n + 1}",
#               email: "test#{n + 1}@test.com",
#               password: "password#{n + 1}",
#               admin: false,
#               )
# end

# User.create!(
#   name: 'admin',
#   department: '部署1',
#   email: 'admin@example.com',
#   admin: true,
#   password: 'password',
#   password_confirmation: 'password',
# )


#   Team.create!(name: "team1",
#               owner_id: 1
#               )


  Team.create!(name: "team2",
              owner_id: 2
              )

# 5.times do |n|
#   Issue.create!(title: "課題#{n + 1}",
#                 goal: "ゴール#{n + 1}",
#                 gap: "ギャップ#{n + 1}",
#                 due_date_at: "2022/12/13",
#                 priority: 0,
#                 status: 0,
#                 done_flag: false,
#                 user_id: 1,
#                 team_id: 1,
#               )
#   Plan.create!(action: "アクション#{n + 1}",
#                 pic: 1,
#                 due_date_at: "2022/12/13",
#                 status: 0,
#                 feedback: 0,
#                 user_id: 1,
#                 issue_id: 1,
#                 team_id: 1,
#               )
# end


5.times do |n|
  Issue.create!(title: "課題#{n + 6}",
                goal: "ゴール#{n + 6}",
                gap: "ギャップ#{n + 6}",
                due_date_at: "2022/12/17",
                priority: 0,
                status: 0,
                done_flag: false,
                user_id: 2,
                team_id: 2,
              )
  Plan.create!(action: "アクション#{n + 6}",
                pic: 2,
                due_date_at: "2022/12/16",
                status: 0,
                feedback: 0,
                user_id: 2,
                issue_id: 2,
                team_id: 2,
              )
end