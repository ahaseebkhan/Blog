class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :posts, foreign_key: :creator_id
  has_many :created_groups, foreign_key: :creator_id, class_name: 'Group'
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :comments

  validates :display_name, presence: true
end
