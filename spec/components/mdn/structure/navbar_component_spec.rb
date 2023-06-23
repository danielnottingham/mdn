# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::Structure::NavbarComponent, type: :component do
  it "renders navbar title" do
    rendered = render_inline(described_class.new(title: "Some logo"))

    expect(rendered.to_html).to have_text("Some logo")
  end

  it "renders navbar with item" do
    rendered = render_inline(described_class.new(title: "Some logo")) do |nav|
      nav.with_item(href: "/some/link") { "link 1" }
    end

    expect(rendered.to_html).to have_link("link 1", href: "/some/link")
  end
end
