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
        render(Mdn::Action::ButtonComponent.new(color:, size:, disabled:, builder:, href:)) do
          content
        end
      end

      # @!group Default
      # @label Default button
      def default
        render(Mdn::Action::ButtonComponent.new) { "Default button" }
      end
      # @!endgroup

      # @!group Light
      # @label Light button
      def button_light
        render(Mdn::Action::ButtonComponent.new(color: :light)) { "Light button" }
      end
      # @!endgroup

      # @!group Red
      # @label Red button
      def button_red
        render(Mdn::Action::ButtonComponent.new(color: :red)) { "Red button" }
      end
      # @!endgroup

      # @!group Emerald
      # @label Emerald button
      def button_emerald
        render(Mdn::Action::ButtonComponent.new(color: :emerald)) { "Emerald button" }
      end
      # @!endgroup

      # @!group Slate
      # @label Slate button
      def button_slate
        render(Mdn::Action::ButtonComponent.new(color: :slate)) { "Slate button" }
      end
      # @!endgroup
    end
  end
end
