# frozen_string_literal: true

module Application
  class FrameComponent < ViewComponent::Base
    attr_reader :current_user, :current_controller

    def initialize(current_user:, current_controller:)
      @current_user = current_user
      @current_controller = current_controller
    end

    private

    def activate_accounts_menu_item?
      current_controller.is_a?(AccountsController)
    end

    def activate_categories_menu_item?
      current_controller.is_a?(CategoriesController)
    end
  end
end
