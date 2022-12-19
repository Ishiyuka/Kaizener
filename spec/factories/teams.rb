FactoryBot.define do
  factory :team do
    name { 'team1' }
    owner { FactoryBot.create(:user) }
  end
end
