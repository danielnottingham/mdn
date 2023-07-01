# frozen_string_literal: true

module Mdn
  module Form
    class FileFieldComponentPreview < ViewComponent::Preview
      def playground(**html_options)
        mdn_file_field(**html_options)
      end
    end
  end
end
