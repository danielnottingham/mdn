# frozen_string_literal: true

module Categories
  class ListComponent < ViewComponent::Base
    attr_accessor :categories

    def initialize(categories:)
      @categories = categories
    end

    private

    def render?
      categories.any?
    end
  end
end
