# frozen_string_literal: true

module Mdn
  module Form
    class ColorFieldComponentPreview < ViewComponent::Preview
      def default
        mdn_color_field(id: "color-input")
      end
    end
  end
end
