# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::Structure::MainContentComponent, type: :component do
  it "renders h2 and content" do
    rendered = render_inline(described_class.new(title: "main content title") { "content" })

    expect(rendered).to have_css("h2", text: "main content title").and have_css("main", text: "content")
  end
end
