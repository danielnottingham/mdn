# frozen_string_literal: true

module Mdn
  module Feedback
    class ToastComponentPreview < ViewComponent::Preview
      # @param content
      # @param type [Symbol] select [info, success, error, warning]
      def playground(type: :info, content: "Some message.")
        mdn_toast(type:) { content }
      end

      def default
        mdn_toast { "This is a default Toast." }
      end

      # @!group Type Success
      # @label Success
      def with_type_success
        mdn_toast(type: :success) { "This is a success message for Toast." }
      end
      # @!endgroup

      # @!group Type Error
      # @label Error
      def with_type_error
        mdn_toast(type: :error) { "This is an error message for Toast." }
      end
      # @!endgroup
    end
  end
end
