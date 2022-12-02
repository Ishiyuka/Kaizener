class User < ApplicationRecord
  has_many :assigns, dependent: :destroy
  has_many :assign_teams, through: :assigns, source: :team
  has_many :issues, dependent: :destroy
  has_many :plans, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
