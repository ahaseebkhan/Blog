class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def update?
    comment.user == user || comment.commentable.group.creator == user
  end

  def destroy?
    comment.user == user || comment.commentable.group.creator == user
  end
end
