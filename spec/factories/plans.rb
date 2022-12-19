FactoryBot.define do
  factory :plan do
    action { "action" }
    pic { "1" }
    due_date_at { "2022-12-02" }
    status { 1 }
    feedback { 1 }
    user
    team
    issue
  end
end
