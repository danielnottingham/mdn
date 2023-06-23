# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::Structure::ShellComponent, type: :component do
  it "renders the navbar content" do
    render_inline(described_class.new) do |shell|
      shell.with_navbar { "navbar content here" }
    end

    expect(page).to have_text("navbar content here")
  end

  it "renders the sidebar content" do
    render_inline(described_class.new(title: "My project")) do |shell|
      shell.with_sidebar { "sidebar content here" }
    end

    expect(page).to have_text("sidebar content here")
  end

  it "renders the main content" do
    render_inline(described_class.new(title: "My project")) do |shell|
      shell.with_main_content { "main content here" }
    end

    expect(page).to have_text("main content here")
  end
end
