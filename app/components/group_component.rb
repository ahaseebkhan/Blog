# frozen_string_literal: true

class GroupComponent < ViewComponent::Base
  with_collection_parameter :group
  attr_reader :joined_group_ids, :user_id

  def initialize(group:, joined_group_ids:, user_id:)
    @group = group
    @joined_group_ids = joined_group_ids
    @user_id = user_id
  end
end
