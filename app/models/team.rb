class Team < ApplicationRecord
  has_many :assigns, dependent: :destroy
  has_many :members, through: :assigns, source: :user
  has_many :issues, dependent: :destroy
end
