# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::Form::LabelComponent, type: :component do
  context "when content is present" do
    it "renders without problems" do
      rendered = render_inline(described_class.new) { "Content" }

      expect(rendered.to_html).to be_present
    end
  end

  context "when content isn't present" do
    it "doesn't render" do
      rendered = render_inline(described_class.new)

      expect(rendered.to_html).to be_empty
    end
  end
end
