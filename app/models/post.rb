class Post < ApplicationRecord
  belongs_to :group
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :comments, as: :commentable

  has_rich_text :body
end
