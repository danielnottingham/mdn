# frozen_string_literal: true

module Mdn
  module Structure
    module Navbar
      class ItemComponent < ViewComponent::Base
        attr_reader :builder, :href, :icon, :active, :html_options

        def initialize(builder:, href:, icon: nil, active: false, **html_options)
          @builder = builder
          @href = href
          @icon = icon
          @active = active
          @html_options = html_options
        end

        private

        def menu_builder(*, &)
          case builder
          when :button_to
            button_to(*, &)
          when :link_to
            link_to(*, &)
          end
        end

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
