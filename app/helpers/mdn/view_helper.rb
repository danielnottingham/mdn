# frozen_string_literal: true

module Mdn
  module ViewHelper
    MDN_HELPERS = {
      button: "Mdn::Action::ButtonComponent",
      checkbox: "Mdn::Form::CheckboxComponent",
      color_field: "Mdn::Form::ColorFieldComponent",
      file_field: "Mdn::Form::FileFieldComponent",
      icon: "Mdn::IconsAndImages::IconComponent",
      label: "Mdn::Form::LabelComponent",
      main_content: "Mdn::Structure::MainContentComponent",
      navbar: "Mdn::Structure::NavbarComponent",
      radio: "Mdn::Form::RadioComponent",
      select: "Mdn::Form::SelectComponent",
      shell: "Mdn::Structure::ShellComponent",
      sidebar: "Mdn::Structure::SidebarComponent",
      text_area: "Mdn::Form::TextAreaComponent",
      text_field: "Mdn::Form::TextFieldComponent",
      toast: "Mdn::Feedback::ToastComponent"
    }.freeze

    MDN_HELPERS.each do |name, component|
      define_method "mdn_#{name}" do |*args, **kwargs, &block|
        render component.constantize.new(*args, **kwargs), &block
      end
    end

    def mdn_form_with(**options, &)
      options.deep_merge!(builder: Mdn::FormBuilder)
      form_with(**options, &)
    end
  end
end
