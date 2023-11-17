# frozen_string_literal: true

module Mdn
  module Form
    class SelectComponent < ViewComponent::Base
      attr_reader :selected, :prompt, :options, :html_options

      def initialize(selected: nil, prompt: nil, options: {}, **html_options)
        @selected = selected
        @prompt = prompt
        @options = options
        @html_options = html_options
      end

      private

      def select_classes
        "bg-white border border-gray-300 rounded block w-full outline-none hover:border-indigo-600
        focus:border-indigo-500 focus:outline-offset-0 focus:outline-4 focus:border-indigo-500 transition-all
        duration-150 ease-in-out".squish
      end
    end
  end
end
