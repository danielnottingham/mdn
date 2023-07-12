# frozen_string_literal: true

module Mdn
  module Structure
    class SidebarComponentPreview < ViewComponent::Preview
      def playground
        mdn_sidebar do |side|
          side.with_item(href: "#", icon: :home, active: true) { "Dashboard" }
          side.with_item(href: "#", icon: :cog_6_tooth) { "Settings" }
        end
      end
    end
  end
end
