FactoryBot.define do
  factory :user do
    name { 'Factory' }
    department { 'Factory' }
    email { 'factory@example.com' }
    password { 'factory' }
    password_confirmation { 'factory' }
    admin { false }
  end
end
