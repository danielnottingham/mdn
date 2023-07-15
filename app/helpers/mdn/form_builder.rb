# frozen_string_literal: true

module Mdn
  class FormBuilder < ActionView::Helpers::FormBuilder
    attr_reader :template

    delegate :render, to: :template

    def mdn_checkbox(attribute, content = nil, **args)
      content ||= label_content(attribute)
      render(Mdn::Form::CheckboxComponent.new(**checkbox_options(attribute), **args)) { content }
    end

    def mdn_color_field(attribute, **args)
      render Mdn::Form::ColorFieldComponent.new(
        **html_options(attribute), **args
      ) do |input|
        yield input if block_given?
      end
    end

    def mdn_file_field(attribute, **args)
      self.multipart = true
      render Mdn::Form::FileFieldComponent.new(**html_options(attribute), **args) do |input|
        yield input if block_given?
      end
    end

    def mdn_label(attribute, content = nil, **args)
      content ||= label_content(attribute)
      render Mdn::Form::LabelComponent.new(**label_options(attribute), **args) do |input|
        yield input if block_given?
        content
      end
    end

    def mdn_select(attribute, **args)
      options = html_options(attribute)
      render Mdn::Form::SelectComponent.new(selected: options[:value], **options, **args) do |slot|
        yield slot if block_given?
      end
    end

    def mdn_submit(content = nil, **args)
      render(Mdn::Action::ButtonComponent.new(builder: :button_tag, **args)) { content || submit_text }
    end

    def mdn_text_field(attribute, **args, &)
      render_text_field_of("text", attribute, **args, &)
    end

    private

    def render_text_field_of(type, attribute, **args)
      render Mdn::Form::TextFieldComponent.new(
        type: type,
        **html_options(attribute),
        **args
      ) do |input|
        yield input if block_given?
      end
    end

    def label_options(attribute)
      html_options(attribute).transform_keys({ id: :for })
    end

    def checkbox_options(attribute)
      html_options(attribute).transform_keys({ value: :checked })
    end

    def html_options(attribute)
      {
        name: name(attribute),
        id: id(attribute),
        value: object.try(:public_send, attribute)
      }
    end

    def name(attribute)
      "#{object_name}[#{attribute}]"
    end

    def id(attribute)
      "#{object_name}_#{attribute}".delete("]").tr("^-a-zA-Z0-9:.", "_")
    end

    def submit_text
      submit_key = object.new_record? ? "helpers.submit.create" : "helpers.submit.update"
      I18n.t(submit_key, model: object.class.to_s)
    end
  end
end
