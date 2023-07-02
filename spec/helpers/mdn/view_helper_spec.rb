# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::ViewHelper do
  def process_html(html)
    Nokogiri::HTML.fragment(html).to_html
  end

  describe "#mdn_button" do
    it "renders Mdn::Action::ButtonComponent" do
      helper_result = process_html(mdn_button)
      component_result = render_inline(Mdn::Action::ButtonComponent.new).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_checkbox" do
    it "renders Mdn::Form::CheckboxComponent" do
      helper_result = process_html(mdn_checkbox(checked: true))
      component_result = render_inline(Mdn::Form::CheckboxComponent.new(checked: true)).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_color_field" do
    it "renders Mdn::Form::ColorFieldComponent" do
      helper_result = process_html(mdn_color_field)
      component_result = render_inline(Mdn::Form::ColorFieldComponent.new).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_file_field" do
    it "renders Mdn::Form::FileFieldComponent" do
      helper_result = process_html(mdn_file_field)
      component_result = render_inline(Mdn::Form::FileFieldComponent.new).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_icon" do
    it "renders Mdn::IconsAndImages::IconComponent" do
      helper_result = process_html(mdn_icon(name: :calendar))
      component_result = render_inline(Mdn::IconsAndImages::IconComponent.new(name: :calendar)).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_label" do
    it "renders Mdn::Form::LabelComponent" do
      helper_result = process_html(mdn_label)
      component_result = render_inline(Mdn::Form::LabelComponent.new { "Label" }).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_main_content" do
    it "renders Mdn::Structure::MainContentComponent" do
      helper_result = process_html(mdn_main_content(title: "Dashboard"))
      component_result = render_inline(Mdn::Structure::MainContentComponent.new(title: "Dashboard")).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_navbar" do
    it "renders Mdn::Structure::NavbarComponent" do
      helper_result = process_html(mdn_navbar(title: "MDN"))
      component_result = render_inline(Mdn::Structure::NavbarComponent.new(title: "MDN")).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_select" do
    it "renders Mdn::Form::SelectComponent" do
      options = { red: "Red", green: "Green", blue: "Blue" }
      helper_result = process_html(mdn_select(options: options))
      component_result = render_inline(Mdn::Form::SelectComponent.new(options: options)).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_shell" do
    it "renders Mdn::Structure::ShellComponent" do
      helper_result = process_html(mdn_shell)
      component_result = render_inline(Mdn::Structure::ShellComponent.new).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_sidebar" do
    it "renders Mdn::Structure::SidebarComponent" do
      helper_result = process_html(mdn_sidebar)
      component_result = render_inline(Mdn::Structure::SidebarComponent.new).to_html

      expect(helper_result).to eq component_result
    end
  end

  describe "#mdn_text_field" do
    it "renders Mdn::Form::TextFieldComponent" do
      helper_result = process_html(mdn_text_field)
      component_result = render_inline(Mdn::Form::TextFieldComponent.new).to_html

      expect(helper_result).to eq component_result
    end
  end
end
