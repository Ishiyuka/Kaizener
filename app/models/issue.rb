class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :plans, dependent: :destroy
  enum status:{未完了: 0, 進行中: 1, 完了: 2 }
  enum priority:{高: 0, 中: 1, 低: 2 }
  mount_uploader :image, ImageUploader
end
