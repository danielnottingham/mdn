# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::Action::ButtonComponent, type: :component do
  it "renders without problems" do
    rendered = render_inline(described_class.new)

    expect(rendered.to_html).to be_present
  end

  context "when the button is disabled" do
    it "renders with disabled css classes" do
      rendered = render_inline(described_class.new(builder: :button_tag, disabled: true))

      expect(rendered.to_html).to have_button("button", class: "cursor-not-allowed")
    end
  end
end
