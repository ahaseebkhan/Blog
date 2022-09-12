class Group < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  validates :name, presence: true

  scope :with_stats, -> { left_outer_joins(:posts).
                          select("groups.*, COUNT(posts.*) AS post_count, MAX(posts.updated_at) as last_activity, 
                                  (SELECT count(*) FROM group_users  WHERE group_id = groups.id) member_count").
                          group('groups.id').order(created_at: :desc) }
  scope :created_by, -> (user_id) { where(creator_id: user_id) }
  scope :joined_by, -> (user_id) { joins(:group_users).where('group_users.user_id = ?', user_id) }
end
