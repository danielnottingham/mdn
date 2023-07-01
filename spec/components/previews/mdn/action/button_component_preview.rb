# frozen_string_literal: true

module Mdn
  module Action
    class ButtonComponentPreview < ViewComponent::Preview
      # @param content
      # @param builder [Symbol] select [link_to, button_to, button_tag]
      # @param color [Symbol] select [indigo, light, red, emerald, slate]
      # @param size [Symbol] select [xs, sm, base, large, xl]
      # @param disabled [Boolean]
      # @param href [String]
      def playground(
        builder: :link_to,
        color: :indigo,
        size: :base,
        disabled: false,
        href: nil,
        content: "Some text"
      )
        mdn_button(color:, size:, disabled:, builder:, href:) do
          content
        end
      end

      # @!group Default
      # @label Default button
      def default
        mdn_button { "Button text" }
      end
      # @!endgroup

      # @!group Colors
      # @label Light button
      def with_color_light
        mdn_button(color: :light) { "Button text" }
      end

      # @label Red button
      def with_color_red
        mdn_button(color: :red) { "Button text" }
      end

      # @label Emerald button
      def with_color_emerald
        mdn_button(color: :emerald) { "Button text" }
      end

      # @label Slate button
      def with_color_slate
        mdn_button(color: :slate) { "Button text" }
      end
      # @!endgroup
    end
  end
end
