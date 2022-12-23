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

# 5.times do |n|
#   user = User.create!( name: "admin#{n + 1}",
#                       department: "部署#{n + 1}",
#                       email: "admin#{n + 1}@example.com",
#                       admin: true,
#                       password: "password#{n + 1}",
#                 )
#   team = Team.create!(name: "team#{n + 1}",
#                       owner_id: user.id
#                 )
#   assign = Assign.create!(
#                           user_id: user.id,
#                           team_id: team.id
#                           )
#   issue = Issue.create!(title: "課題#{n + 1}",
#                 goal: "ゴール#{n + 1}",
#                 gap: "ギャップ#{n + 1}",
#                 due_date_at: "2022/12/13",
#                 priority: 0,
#                 status: 0,
#                 done_flag: false,
#                 user_id: user.id,
#                 team_id: team.id,
#                 )
#   Plan.create!(action: "アクション#{n + 1}",
#                 pic: user.id,
#                 due_date_at: "2022/12/13",
#                 status: 0,
#                 feedback: 0,
#                 user_id: user.id,
#                 team_id: team.id,
#                 issue_id: issue.id
#   )
# end

1.times do |n|
user = User.create!(name: "佐藤美咲",
  department: "Grobal Supply Chain",
  email: "sato_misaki@kaizener.com",
  password: "password",
  admin: true,
  )
team = Team.create!(name: "サービス部門",
  owner_id: user.id)
assign = Assign.create!(
  user_id: user.id,
  team_id: team.id
  )
issue = Issue.create!(title: "現場の生産性が低い",
  goal: "5Sがきちんとされていること",
  gap: "整理整頓されていない",
  due_date_at: "2023/1/30",
  priority: 0,
  status: 0,
  done_flag: false,
  user_id: user.id,
  team_id: team.id,
  )
Plan.create!(action: "現場へ5Sの教育プランを立てる",
  pic: user.id,
  due_date_at: "2022/12/30",
  status: 0,
  feedback: 0,
  user_id: user.id,
  team_id: team.id,
  issue_id: issue.id
  )
end

1.times do |n|
user = User.create!(name: "吉田翔太",
  department: "Grobal Supply Chain",
  email: "yoshida_syota@kaizener.com",
  password: "password",
  admin: true,
  )
team = Team.create!(name: "販売部門",
  owner_id: user.id
  )
assign = Assign.create!(
  user_id: user.id,
  team_id: team.id
  )
issue = Issue.create!(title: "箱ダメージにより、返品が増えている",
  goal: "箱ダメージ品を減らし、顧客満足度を上げる",
  gap: "箱ダメージに対する対策がない",
  cause: "現場で、箱の傷がどこからNGなのか認識されていなかった",
  due_date_at: "2023/1/30",
  priority: 1,
  status: 1,
  done_flag: false,
  user_id: user.id,
  team_id: team.id,
  )
Plan.create!(action: "現場への教育プランを立てる",
  pic: user.id,
  due_date_at: "2022/12/30",
  status: 0,
  feedback: 0,
  user_id: user.id,
  team_id: team.id,
  issue_id: issue.id
)
end

1.times do |n|
user = User.create!(name: "高橋舞",
  department: "Grobal Supply Chain",
  email: "takahashi_mai@kaizener.com",
  password: "password",
  admin: true,
  )
team = Team.create!(name: "トランスポート部門",
  owner_id: user.id
  )
assign = Assign.create!(
  user_id: user.id,
  team_id: team.id
  )
issue = Issue.create!(title: "チャーター費用が増加している",
  goal: "チャーターではなく、ルート便を使うようにする",
  gap: "社員の許可なくチャーター便を使っていた",
  due_date_at: "002023/1/30",
  priority: 2,
  status: 2,
  done_flag: false,
  user_id: user.id,
  team_id: team.id,
  )
Plan.create!(action: "チャーター手配をする前に、この配送方法で良いのか、マネージャーに確認するプロセスを作る",
  pic: user.id,
  due_date_at: "002022/12/30",
  status: 0,
  feedback: 0,
  user_id: user.id,
  team_id: team.id,
  issue_id: issue.id
)
end

User.create!(name: "鈴木愛",
  department: "Grobal Supply Chain",
  email: "suzuki_ai@kaizener.com",
  password: "password",
  admin: false,
  )

User.create!(name: "伊藤茜",
  department: "Grobal Supply Chain",
  email: "ito_akane@kaizener.com",
  password: "password",
  admin: false,
  )

User.create!(name: "渡辺里奈",
  department: "Grobal Supply Chain",
  email: "watanabe_rina@kaizener.com",
  password: "password",
  admin: false,
  )

User.create!(name: "山本美穂",
  department: "Grobal Supply Chain",
  email: "yamamoto_miho@kaizener.com",
  password: "password",
  admin: false,
  )

User.create!(name: "山田拓也",
  department: "Grobal Supply Chain",
  email: "yamada_takuya@kaizener.com",
  password: "password",
  admin: false,
  )

User.create!(name: "佐々木健太",
  department: "Grobal Supply Chain",
  email: "sasaki_kenta@kaizener.com",
  password: "password",
  admin: false,
  )

User.create!(name: "山口大輝",
  department: "Grobal Supply Chain",
  email: "yamaguchi_daiki@kaizener.com",
  password: "password",
  admin: false,
  )