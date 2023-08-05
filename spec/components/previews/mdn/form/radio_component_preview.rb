# frozen_string_literal: true

module Mdn
  module Form
    class RadioComponentPreview < ViewComponent::Preview
      # @param content
      # @param checked [Boolean]
      # @param disabled [Boolean]
      def playground(checked: false, disabled: false, content: "Some content", **)
        mdn_radio(checked:, disabled:, **) do
          content
        end
      end

      # @!group Default
      # @label Default radio
      def default_radio
        mdn_radio { "Default radio" }
      end
      # @!endgroup

      # @!group Disabled
      # @label Disabled radio
      def disabled_radio
        mdn_radio(disabled: true) { "Disabled radio" }
      end
      # @!endgroup

      # @!group Checked
      # @label Checked radio
      def checked_radio
        mdn_radio(checked: true) { "Checked radio" }
      end
      # @!endgroup
    end
  end
end
