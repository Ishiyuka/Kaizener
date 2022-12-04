class Team < ApplicationRecord
  has_many :assigns, dependent: :destroy
  has_many :assign_users, through: :assigns, source: :user
  has_many :issues, dependent: :destroy
end
