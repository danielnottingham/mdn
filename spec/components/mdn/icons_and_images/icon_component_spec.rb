# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::IconsAndImages::IconComponent, type: :component do
  context "when is informed a valid icon name" do
    it "renders without problems" do
      icon_name = Mdn::IconsAndImages::IconComponent::ICON_TYPE.keys.sample
      rendered = render_inline(described_class.new(name: icon_name))

      expect(rendered.to_html).to be_present
    end
  end

  context "when is informed an invalid icon name" do
    it "does not render" do
      icon_name = "invalid-name-icon"
      rendered = render_inline(described_class.new(name: icon_name))

      expect(rendered.to_html).to be_empty
    end
  end

  context "when a name is not informed" do
    it "does not render" do
      icon_name = nil
      rendered = render_inline(described_class.new(name: icon_name))

      expect(rendered.to_html).to be_empty
    end
  end
end
