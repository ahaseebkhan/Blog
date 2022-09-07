class GroupPolicy < ApplicationPolicy
  attr_reader :user, :group

  def initialize(user, group)
    @user = user
    @group = group
  end

  def join?
    group.creator != user
  end

  def create_post?
    GroupUser.is_member?(user.id, group.id) || group.creator == user
  end

  def update?
    group.creator == user
  end
end
