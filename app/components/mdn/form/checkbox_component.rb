# frozen_string_literal: true

module Mdn
  module Form
    class CheckboxComponent < ViewComponent::Base
      attr_reader :checked, :disabled, :html_options

      CHECK_BOX_CLASSES = "w-4 h-4 text-indigo-500 bg-white rounded border-gray-300 focus:ring-indigo-500 focus:ring-2"
      LABEL_CLASSES = "text-sm font-medium text-gray-900"

      def initialize(checked: false, disabled: false, **html_options)
        @checked = checked
        @disabled = disabled
        @html_options = html_options
      end

      private

      def label_id
        html_options[:id] || content
      end

      def check_box_options
        {
          class: check_box_classes,
          disabled: disabled,
          id: content&.tr(" ", "_")
        }.merge(html_options)
      end

      def check_box_classes
        [CHECK_BOX_CLASSES, { "cursor-not-allowed" => disabled }]
      end

      def label_classes
        [LABEL_CLASSES, { "text-gray-400 cursor-not-allowed" => disabled }]
      end
    end
  end
end
