class User < ApplicationRecord
  has_many :assigns, dependent: :destroy
  has_many :assign_teams, through: :assigns, source: :team
  has_many :issues, dependent: :destroy
  has_many :plans, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト(一般)"
      user.department ="一般"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.name = "ゲスト（管理者）"
      user.department = "管理者"
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end
  mount_uploader :icon, ImageUploader
end
