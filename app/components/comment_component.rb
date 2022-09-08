# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
  attr_reader :comment, :edit, :delete, :user_id

  def initialize(comment:, user_id:, edit: true, delete: true)
    @comment = comment
    @edit = edit
    @delete = delete
    @user_id = user_id
  end
end
