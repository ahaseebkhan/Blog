class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :comment, optional: true, class_name: 'Comment'
  has_many :comments, foreign_key: :comment_id, dependent: :destroy

  has_rich_text :body

  validates :body, presence: true
end
