# frozen_string_literal: true

module Mdn
  module Structure
    class SidebarComponent < ViewComponent::Base
      renders_many :items, Mdn::Structure::Sidebar::ItemComponent
    end
  end
end
