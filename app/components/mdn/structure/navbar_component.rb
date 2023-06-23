# frozen_string_literal: true

module Mdn
  module Structure
    class NavbarComponent < ViewComponent::Base
      attr_reader :title

      renders_many :items, Mdn::Structure::Navbar::ItemComponent

      def initialize(title:)
        @title = title
      end
    end
  end
end
