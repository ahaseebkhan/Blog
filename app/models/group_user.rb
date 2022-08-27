class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates_uniqueness_of :user_id, scope: :group_id
  validate :not_creator

  def self.is_member?(user_id, group_id)
    GroupUser.find_by(user_id: user_id, group_id: group_id).present?
  end

  private

  def not_creator
    return unless group.creator == user
    
    errors.add(:base, "You can't join a group you created.")
  end
end
