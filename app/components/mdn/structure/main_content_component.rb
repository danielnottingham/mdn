# frozen_string_literal: true

module Mdn
  module Structure
    class MainContentComponent < ViewComponent::Base
      attr_reader :title

      renders_many :actions, ->(&block) { content_tag :div, class: "flex flex-row gap-2 mb-1 mr-1", &block }

      def initialize(title:)
        @title = title
      end
    end
  end
end
