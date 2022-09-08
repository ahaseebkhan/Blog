# frozen_string_literal: true

class PostComponent < ViewComponent::Base
  with_collection_parameter :post
  attr_reader :edit, :delete, :user_id

  def initialize(post:, user_id:, edit:, delete:)
    @post = post
    @edit = edit
    @delete = delete
    @user_id = user_id
  end
end
