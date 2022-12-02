class Team < ApplicationRecord
  has_many :assigns, dependent: :destroy
  has_many :assigns_users, through: :assigns, source: :user
  has_many :issues, dependent: :destroy
  has_many :plans, dependent: :destroy
end
