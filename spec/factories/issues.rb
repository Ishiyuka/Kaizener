FactoryBot.define do
  factory :issue do
    title { "MyString" }
    detail { "MyText" }
    image { "MyString" }
    cause { "MyText" }
    goal { "MyText" }
    gap { "MyText" }
    due_date_at { "2022-11-29" }
    priority { 1 }
    status { 1 }
    done_flag { false }
  end
end
