# frozen_string_literal: true

module Mdn
  module ViewHelper
    MDN_HELPERS = {
      main_content: "Mdn::Structure::MainContentComponent",
      navbar: "Mdn::Structure::NavbarComponent",
      shell: "Mdn::Structure::ShellComponent",
      sidebar: "Mdn::Structure::SidebarComponent"
    }.freeze

    MDN_HELPERS.each do |name, component|
      define_method "mdn_#{name}" do |*args, **kwargs, &block|
        render component.constantize.new(*args, **kwargs), &block
      end
    end
  end
end
