# frozen_string_literal: true

module Mdn
  module Form
    class TextFieldComponent < ViewComponent::Base
      attr_reader :size, :html_options

      SIZES_CLASSES = { small: "p-2 text-sm", base: "p-3 text-sm", large: "p-4 sm:text-md" }.freeze

      def initialize(size: :base, **html_options)
        @size = size
        @html_options = html_options
      end

      private

      def text_field_classes
        [default_classes, size_classes]
      end

      def default_classes
        "block w-full border border-gray-300 bg-gray-50 text-gray-900 focus:border-indigo-500 focus:ring-indigo-500"
      end

      def wrapper_classes
        "flex flex-col gap-2"
      end

      def size_classes
        SIZES_CLASSES[size]
      end
    end
  end
end
