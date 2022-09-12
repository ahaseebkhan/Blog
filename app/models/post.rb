class Post < ApplicationRecord
  belongs_to :group
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :comments, as: :commentable, dependent: :destroy

  has_rich_text :body

  validates :title, :body, presence: true

  scope :with_last_activity, -> { left_outer_joins(:comments).
                                  select("posts.*, MAX(comments.updated_at) as last_activity").
                                  group('posts.id').order(created_at: :desc) }
end
