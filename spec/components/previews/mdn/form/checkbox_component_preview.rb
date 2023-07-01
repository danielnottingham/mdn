# frozen_string_literal: true

module Mdn
  module Form
    class CheckboxComponentPreview < ViewComponent::Preview
      # @param content
      # @param checked [Boolean]
      # @param disabled [Boolean]
      def playground(checked: false, disabled: false, content: "Some content")
        mdn_checkbox(checked:, disabled:) do
          content
        end
      end

      # @!group Default
      # @label Default checkbox
      def default_checkbox
        mdn_checkbox { "Content label" }
      end
      # @!endgroup

      # @!group Disabled
      # @label Disabled checkbox
      def disabled_checkbox
        mdn_checkbox(disabled: true) { "Disabled" }
      end
      # @!endgroup

      # @!group Checked
      # @label Checked checkbox
      def checked_checkbox
        mdn_checkbox(checked: true) { "Checked" }
      end
      # @!endgroup
    end
  end
end
