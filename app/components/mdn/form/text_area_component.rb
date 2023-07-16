# frozen_string_literal: true

module Mdn
  module Form
    class TextAreaComponent < ViewComponent::Base
      attr_reader :html_options

      def initialize(**html_options)
        @html_options = html_options
      end

      private

      def text_area_classes
        "block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-indigo-500
        focus:border-indigo-500".squish
      end
    end
  end
end
