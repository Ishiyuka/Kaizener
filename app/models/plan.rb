class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :issue
  belongs_to :team
  enum status:{未完了: 0, 進行中: 1, 完了: 2 }
  enum feedback:{要改善: 0, 様子見: 1, 改善できた！: 2 }
end
