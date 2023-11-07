# frozen_string_literal: true

module Categories
  class IndexPage < ApplicationPage
    attr_reader :categories, :current_user

    def initialize(categories:, current_user:)
      @categories = categories
      @current_user = current_user
    end
  end
end
