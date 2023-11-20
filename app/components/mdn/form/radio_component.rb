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
        "hidden peer"
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
        "inline-flex items-center justify-center w-full p-5 text-gray-500 bg-white border border-gray-200
          rounded cursor-pointer peer-checked:border-blue-600 peer-checked:text-blue-600 hover:text-gray-600
          hover:bg-gray-100".squish
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
