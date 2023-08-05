# frozen_string_literal: true

module Mdn
  module Form
    class RadioComponent < ViewComponent::Base
      attr_reader :checked, :disabled, :html_options

      def initialize(checked: false, disabled: false, **html_options)
        @checked = checked
        @disabled = disabled
        @html_options = html_options
      end

      private

      def radio_classes
        [base_classes, disabled_classes]
      end

      def base_classes
        "w-4 h-4 text-indigo-600 bg-white border-gray-300 focus:ring-indigo-500 focus:ring-2"
      end

      def disabled_classes
        "cursor-not-allowed" if disabled
      end

      def label_for
        html_options[:id] || transform_content_to_for_attribute
      end

      def label_classes
        [label_base_classes, label_disabled_classes]
      end

      def label_base_classes
        "text-sm font-medium text-gray-900"
      end

      def label_disabled_classes
        "text-gray-400 cursor-not-allowed" if disabled
      end

      def transform_content_to_for_attribute
        "_#{content.tr(' ', '_')}"
      end
    end
  end
end
