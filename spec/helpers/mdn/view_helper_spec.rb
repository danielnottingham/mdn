# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::ViewHelper do
  def process_html(html)
    Nokogiri::HTML.fragment(html).to_html
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
end
