FactoryBot.define do
  factory :issue do
    title { "title" }
    detail { "detail" }
    image { "image" }
    cause { "cause" }
    goal { "goal" }
    gap { "gap" }
    due_date_at { "2022-11-29" }
    priority { 1 }
    status { 1 }
    done_flag { false }
    user
    team
  end
end
