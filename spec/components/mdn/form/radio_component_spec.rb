# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::Form::RadioComponent, type: :component do
  it "renders without problems" do
    rendered = render_inline(described_class.new) { "Content label" }

    expect(rendered.to_html).to be_present
  end
end
