# frozen_string_literal: true

module Mdn
  module ViewHelper
    MDN_HELPERS = {
      button: "Mdn::Action::ButtonComponent",
      checkbox: "Mdn::Form::CheckboxComponent",
      color_field: "Mdn::Form::ColorFieldComponent",
      file_field: "Mdn::Form::FileFieldComponent",
      label: "Mdn::Form::LabelComponent",
      main_content: "Mdn::Structure::MainContentComponent",
      navbar: "Mdn::Structure::NavbarComponent",
      select: "Mdn::Form::SelectComponent",
      shell: "Mdn::Structure::ShellComponent",
      sidebar: "Mdn::Structure::SidebarComponent",
      text_field: "Mdn::Form::TextFieldComponent"
    }.freeze

    MDN_HELPERS.each do |name, component|
      define_method "mdn_#{name}" do |*args, **kwargs, &block|
        render component.constantize.new(*args, **kwargs), &block
      end
    end
  end
end
