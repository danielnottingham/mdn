# frozen_string_literal: true

module Mdn
  module Structure
    module Navbar
      class ItemComponent < ViewComponent::Base
        attr_reader :href, :icon, :active

        def initialize(href:, icon: nil, active: false)
          @href = href
          @icon = icon
          @active = active
        end

        private

        def navbar_item_classes
          [base_classes, active_classes]
        end

        def base_classes
          "flex items-center p-2 mx-2 text-base font-medium text-indigo-500 hover:bg-indigo-100 lg:order-2"
        end

        def active_classes
          "bg-indigo-100 hover:bg-indigo-200 border border-indigo-300" if active
        end
      end
    end
  end
end
