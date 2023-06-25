# frozen_string_literal: true

module Mdn
  module Form
    class TextFieldComponentPreview < ViewComponent::Preview
      # @param size [Symbol] select [small, base, large]
      # @param placeholder
      def playground(size: :base, placeholder: "placeholder")
        render(Mdn::Form::TextFieldComponent.new(size:, id: "fake-id", placeholder:))
      end
    end
  end
end
