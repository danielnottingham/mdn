# frozen_string_literal: true

module Mdn
  class FormBuilder < ActionView::Helpers::FormBuilder
    attr_reader :template

    delegate :render, to: :template

    def mdn_checkbox(attribute, content = nil, **)
      content ||= label_content(attribute)
      render(Mdn::Form::CheckboxComponent.new(**checkbox_options(attribute), **)) { content }
    end

    def mdn_color_field(attribute, **)
      render Mdn::Form::ColorFieldComponent.new(
        **html_options(attribute), **
      ) do |input|
        yield input if block_given?
      end
    end

    def mdn_date_field(attribute, **, &)
      render_text_field_of("date", attribute, **, &)
    end

    def mdn_datetime_field(attribute, **, &)
      render_text_field_of("datetime-local", attribute, **datetime_options(attribute), **, &)
    end

    def mdn_email_field(attribute, **, &)
      render_text_field_of("email", attribute, **, &)
    end

    def mdn_file_field(attribute, **)
      self.multipart = true
      render Mdn::Form::FileFieldComponent.new(**html_options(attribute), **) do |input|
        yield input if block_given?
      end
    end

    def mdn_label(attribute, content = nil, **)
      content ||= label_content(attribute)
      render Mdn::Form::LabelComponent.new(**label_options(attribute), **) do |input|
        yield input if block_given?
        content
      end
    end

    def mdn_password_field(attribute, **, &)
      render_text_field_of("password", attribute, **, &)
    end

    def mdn_radio_button(attribute, tag_value, content = nil, **)
      render(Mdn::Form::RadioComponent.new(**radio_button_options(attribute, tag_value), **)) do
        content
      end
    end

    def mdn_select(attribute, **)
      options = html_options(attribute)
      render Mdn::Form::SelectComponent.new(selected: options[:value], **options, **) do |slot|
        yield slot if block_given?
      end
    end

    def mdn_submit(content = nil, **)
      render(Mdn::Action::ButtonComponent.new(builder: :button_tag, **)) { content || submit_text }
    end

    def mdn_text_area(attribute, **)
      render Mdn::Form::TextAreaComponent.new(**html_options(attribute), **) do |input|
        yield input if block_given?
      end
    end

    def mdn_text_field(attribute, **, &)
      render_text_field_of("text", attribute, **, &)
    end

    private

    def render_text_field_of(type, attribute, **)
      render Mdn::Form::TextFieldComponent.new(
        type: type,
        **html_options(attribute),
        **
      ) do |input|
        yield input if block_given?
      end
    end

    def label_options(attribute)
      html_options(attribute).transform_keys({ id: :for })
    end

    def label_content(attribute)
      ActionView::Helpers::Tags::Translator.new(object, object_name.to_s, attribute, scope: "helpers.label").translate
    end

    def checkbox_options(attribute)
      html_options(attribute).transform_keys({ value: :checked })
    end

    def datetime_options(attribute)
      html_options(attribute).merge(value: object.send(attribute)&.strftime("%Y-%m-%dT%H:%M"))
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

    def radio_button_options(attribute, tag_value)
      {
        name: name(attribute),
        id: radio_id(attribute, tag_value),
        value: tag_value,
        checked: object.send(attribute) == tag_value
      }
    end

    def radio_id(attribute, tag_value)
      "#{id(attribute)}_#{sanitize_value(tag_value)}"
    end

    def sanitize_value(value)
      value.to_s.gsub(/[\s.]/, "_").gsub(/[^-[[:word:]]]/, "").downcase
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
