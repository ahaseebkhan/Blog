# frozen_string_literal: true

class DialogComponent < ViewComponent::Base
  attr_reader :title, :data, :icon

  def initialize(title: false, icon: false, data:)
    @title = title
    @data = data
    @icon = icon
  end

end
