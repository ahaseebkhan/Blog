# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  attr_reader :title, :url, :data

  def initialize(title:, url:, data: {})
    @title = title
    @url = url
    @data = data
  end
end
