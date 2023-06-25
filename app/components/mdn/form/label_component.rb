# frozen_string_literal: true

module Mdn
  module Form
    class LabelComponent < ViewComponent::Base
      attr_reader :html_options

      CLASSES = "text-sm font-medium text-gray-900"

      def initialize(**html_options)
        @html_options = html_options
      end

      private

      def render?
        content.present?
      end

      def options
        html_options.merge(class: CLASSES)
      end
    end
  end
end
