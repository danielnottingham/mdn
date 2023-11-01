# frozen_string_literal: true

module Mdn
  module Structure
    module Sidebar
      class ItemComponent < ViewComponent::Base
        attr_reader :href, :icon, :active

        def initialize(href:, icon: nil, active: false)
          @href = href
          @icon = icon
          @active = active
        end

        private

        def sidebar_item_classes
          ["flex items-center p-2 text-base font-medium rounded text-indigo-500 hover:bg-indigo-200", active_classes]
        end

        def active_classes
          "bg-indigo-100 hover:bg-indigo-200 border border-indigo-300" if active
        end
      end
    end
  end
end
