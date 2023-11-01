# frozen_string_literal: true

module Mdn
  module Action
    class ButtonComponent < ViewComponent::Base
      attr_reader :builder, :color, :size, :disabled, :href, :html_options

      COLORS_CLASSES = {
        indigo: "text-white bg-indigo-500 hover:bg-indigo-600 focus:ring-indigo-300",
        light: "text-gray-900 bg-white border border-gray-300 hover:bg-gray-100 focus:ring-gray-200",
        red: "text-white bg-red-700 hover:bg-red-800 focus:ring-red-300",
        emerald: "text-white bg-emerald-700 hover:bg-emerald-800 focus:ring-emerald-300",
        slate: "text-white bg-slate-500 hover:bg-slate-600 focus:ring-slate-300"
      }.freeze

      SIZES = {
        xs: "px-1.5 py-1.5 text-xs",
        sm: "py-2 px-3 text-sm",
        base: "py-2.5 px-5 text-sm",
        large: "py-3 px-5 text-base",
        xl: "px-6 py-3.5 text-base"
      }.freeze

      def initialize(
        builder: :link_to,
        color: :indigo,
        size: :base,
        disabled: false,
        href: nil,
        **html_options
      )
        @builder = builder
        @color = color
        @size = size
        @disabled = disabled
        @href = href
        @html_options = html_options
      end

      private

      def button_classes
        [default_classes, size_classes, colors_classes]
      end

      def default_classes
        "focus:outline-none focus:ring-4 font-medium inline-flex justify-center items-center gap-1 rounded"
      end

      def disabled_classes
        "bg-gray-100 hover:bg-gray-100 active:bg-gray-100 border-gray-100 text-gray-300 cursor-not-allowed" if disabled
      end

      def colors_classes
        return disabled_classes if disabled

        COLORS_CLASSES[color]
      end

      def size_classes
        SIZES[size]
      end
    end
  end
end
