# frozen_string_literal: true

module Mdn
  module Form
    class FileFieldComponent < ViewComponent::Base
      attr_reader :html_options

      def initialize(**html_options)
        @html_options = html_options
      end

      def file_field_classes
        "block w-full text-gray-900 bg-gray-50 rounded-lg border border-gray-300 cursor-pointer focus:outline-none"
      end
    end
  end
end
