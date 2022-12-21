class Comment < ApplicationRecord
  belongs_to :plan
  belongs_to :user
  validates :content, presence: true, length: { maximum: 200 }
end
