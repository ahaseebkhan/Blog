# frozen_string_literal: true

class PostComponent < ViewComponent::Base
  with_collection_parameter :post
  attr_reader :edit, :delete

  def initialize(post:, edit:, delete:)
    @post = post
    @edit = edit
    @delete = delete
  end
end
