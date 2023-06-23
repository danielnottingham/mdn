# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::Structure::SidebarComponent, type: :component do
  it "renders sidebar with item" do
    rendered = render_inline(described_class.new) do |side|
      side.with_item(href: "/some/link") { "Dashboard" }
    end

    expect(rendered.to_html).to have_link("Dashboard", href: "/some/link")
  end
end
