# frozen_string_literal: true

module Mdn
  module Structure
    class NavbarComponentPreview < ViewComponent::Preview
      # @param title
      def playground(title: "MDN")
        mdn_navbar(title:) do |nav|
          nav.with_item(href: "#", icon: :home, active: true) { "Dashboard" }
          nav.with_item(href: "#", icon: :cog_6_tooth) { "Settings" }
        end
      end
    end
  end
end
