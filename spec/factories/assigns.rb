FactoryBot.define do
  factory :assign do
    user { FactoryBot.create(:user) }
    team { FactoryBot.create(:team) }
  end
end
