# frozen_string_literal: true

module Mdn
  module Structure
    module Navbar
      class ItemComponent < ViewComponent::Base
        attr_reader :href

        def initialize(href:)
          @href = href
        end
      end
    end
  end
end
