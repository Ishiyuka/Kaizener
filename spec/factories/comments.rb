FactoryBot.define do
  factory :comment do
    plan { nil }
    user { nil }
    content { "MyText" }
  end
end
