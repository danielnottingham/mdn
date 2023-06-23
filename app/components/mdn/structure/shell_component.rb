# frozen_string_literal: true

module Mdn
  module Structure
    class ShellComponent < ViewComponent::Base
      renders_one :navbar
      renders_one :sidebar
      renders_one :main_content
    end
  end
end
