# frozen_string_literal: true

require "rails_helper"

RSpec.describe Application::ToastComponent, type: :component do
  context "when different type of message are given" do
    it "renders notice message as success message" do
      result = render_inline(described_class.new(flash: { notice: "Everything is alright!" }))
      expected_result = render_inline(described_class.new(flash: { success: "Everything is alright!" }))

      expect(result.to_html).to eq expected_result.to_html
    end

    it "renders alert message as error message" do
      result = render_inline(described_class.new(flash: { alert: "Everything is wrong" }))
      expected_result = render_inline(described_class.new(flash: { error: "Everything is wrong" }))

      expect(result.to_html).to eq expected_result.to_html
    end
  end
end
