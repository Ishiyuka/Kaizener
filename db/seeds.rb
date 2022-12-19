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

5.times do |n|
  user = User.create!( name: "admin#{n + 1}",
                      department: "部署#{n + 1}",
                      email: "admin#{n + 1}@example.com",
                      admin: true,
                      password: "password#{n + 1}",
                )
  team = Team.create!(name: "team#{n + 1}",
                      owner_id: user.id
                )
  assign = Assign.create!(
                          user_id: user.id,
                          team_id: team.id
                          )
  issue = Issue.create!(title: "課題#{n + 1}",
                goal: "ゴール#{n + 1}",
                gap: "ギャップ#{n + 1}",
                due_date_at: "2022/12/13",
                priority: 0,
                status: 0,
                done_flag: false,
                user_id: user.id,
                team_id: team.id,
                )
  Plan.create!(action: "アクション#{n + 1}",
                pic: user.id,
                due_date_at: "2022/12/13",
                status: 0,
                feedback: 0,
                user_id: user.id,
                team_id: team.id,
                issue_id: issue.id
                )
end