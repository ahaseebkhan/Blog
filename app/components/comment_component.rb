# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
  attr_reader :comment, :edit, :delete

  def initialize(comment:, edit: true, delete: true)
    @comment = comment
    @edit = edit
    @delete = delete
  end
end
