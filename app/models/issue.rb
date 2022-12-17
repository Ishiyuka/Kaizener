class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :plans, dependent: :destroy
  enum status:{未完了: 0, 進行中: 1, 完了: 2 }
  enum priority:{高: 0, 中: 1, 低: 2 }
  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :plans, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true, length: { maximum: 300 }
  validates :goal, presence: true, length: { maximum: 300 }
  validates :gap, presence: true, length: { maximum: 300 }
  validates :due_date_at, presence: true
  validates :priority, presence: true
  validates :status, presence: true
end
