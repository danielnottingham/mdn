# frozen_string_literal: true

module Mdn
  module Form
    class SelectComponentPreview < ViewComponent::Preview
      DEFAULT_OPTIONS = { red: "Red", green: "Green", blue: "Blue" }.freeze
      # @param prompt
      def playground(
        selected: nil,
        prompt: "Select an option",
        options: DEFAULT_OPTIONS,
        **html_options
      )
        mdn_select(selected:, prompt:, options:, **html_options)
      end

      # @!group Default
      # @label Default select
      def default_select
        mdn_select(options: DEFAULT_OPTIONS)
      end
      # @!endgroup
    end
  end
end
