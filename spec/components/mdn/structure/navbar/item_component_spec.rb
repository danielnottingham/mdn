# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::Structure::Navbar::ItemComponent, type: :component do
  it "renders menu item with button_to" do
    rendered = render_inline(described_class.new(builder: :button_to, href: "#")) { "Content button" }

    expect(rendered.to_html).to have_button("Content button")
  end

  it "renders menu item with link_to" do
    rendered = render_inline(described_class.new(builder: :link_to, href: "#")) { "Content link" }

    expect(rendered.to_html).to have_link("Content link", href: "#")
  end
end
