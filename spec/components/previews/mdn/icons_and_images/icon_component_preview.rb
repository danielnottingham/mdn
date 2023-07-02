# frozen_string_literal: true

module Mdn
  module IconsAndImages
    class IconComponentPreview < ViewComponent::Preview
      # @param name
      # @param color [Symbol] select [indigo, current_color, slate, emerald, red]
      def playground(name: :user, color: :current_color)
        mdn_icon(name:, color:)
      end
    end
  end
end
