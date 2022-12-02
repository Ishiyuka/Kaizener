FactoryBot.define do
  factory :plan do
    action { "MyText" }
    pic { "MyString" }
    due_date_at { "2022-12-02" }
    status { 1 }
    feedback { 1 }
  end
end
