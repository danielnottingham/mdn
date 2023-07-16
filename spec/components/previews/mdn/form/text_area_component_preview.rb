# frozen_string_literal: true

module Mdn
  module Form
    class TextAreaComponentPreview < ViewComponent::Preview
      # @param placeholder
      def playground(placeholder: "Some content here ...")
        render(Mdn::Form::TextAreaComponent.new(id: "fake-id", placeholder:))
      end
    end
  end
end
