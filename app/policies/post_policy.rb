class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    GroupUser.is_member?(user.id, post.group_id)
  end

  def destroy?
    post.group.creator == user || post.creator == user
  end

  def update?
    post.group.creator == user || post.creator == user
  end
end
