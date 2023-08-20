# frozen_string_literal: true

module Mdn
  module Feedback
    class ToastComponent < ViewComponent::Base
      attr_reader :type, :html_options

      ICON_CLASSES = "inline-flex h-8 w-8 flex-shrink-0 items-center justify-center rounded"

      TOAST_CLASSES = "flex w-full max-w-xs animate-fade-in-up items-center gap-2 rounded-lg
        border-r-4 bg-gray-700 p-4 text-white opacity-0 shadow".squish

      TOAST_TYPES_CLASSES = {
        info: "border-r-indigo-400",
        success: "border-r-emerald-400",
        error: "border-r-red-500"
      }.freeze

      ICON_TYPES_CLASSES = {
        info: "text-indigo-600 bg-indigo-100",
        success: "text-emerald-600 bg-emerald-100",
        error: "text-red-600 bg-red-100"
      }.freeze

      ICON_TYPES_NAMES = {
        info: :information_circle,
        success: :check,
        error: :x
      }.freeze

      def initialize(type: :info, **html_options)
        @type = type
        @html_options = html_options
      end

      private

      def toast_wrapper_classes
        "fixed -bottom-20 flex w-full items-center justify-center z-20"
      end

      def toast_classes
        [TOAST_CLASSES, TOAST_TYPES_CLASSES[type]]
      end

      def icon_classes
        [ICON_CLASSES, ICON_TYPES_CLASSES[type]]
      end

      def icon_type_name
        ICON_TYPES_NAMES[type]
      end

      def content_classes
        "text-sm font-normal text-white"
      end
    end
  end
end
