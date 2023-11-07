# frozen_string_literal: true

module Categories
  class EditPage < ApplicationPage
    attr_reader :category, :current_user

    def initialize(category:, current_user:)
      @category = category
      @current_user = current_user
    end
  end
end
