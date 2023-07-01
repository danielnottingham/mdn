# frozen_string_literal: true

module Mdn
  module Form
    class ColorFieldComponent < ViewComponent::Base
      attr_reader :html_options

      def initialize(**html_options)
        @html_options = html_options
      end

      private

      def color_field_classes
        "px-1 py-0.5 w-22 h-10 text-sm text-gray-900 bg-white border-gray-300 focus:ring-indigo-500
        hover:border-indigo-600 border block outline-none focus:outline-indigo-100 focus:outline-offset-0
        focus:outline-4 focus:border-indigo-500 transition-all duration-150 ease-in-out rounded-md".squish
      end

      def color_field_options
        { class: color_field_classes }.merge(html_options)
      end
    end
  end
end
