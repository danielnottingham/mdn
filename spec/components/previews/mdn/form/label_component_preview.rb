# frozen_string_literal: true

module Mdn
  module Form
    class LabelComponentPreview < ViewComponent::Preview
      # @param content
      def playground(content: "Label")
        render(Mdn::Form::LabelComponent.new) { content }
      end
    end
  end
end
