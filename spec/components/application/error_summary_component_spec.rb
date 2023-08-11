# frozen_string_literal: true

require "rails_helper"

RSpec.describe Application::ErrorSummaryComponent, type: :component do
  context "when record has errors" do
    it "renders a title with error count" do
      account = Account.new
      account.errors.add(:title, :blank)

      rendered = render_inline(described_class.new(record: account))

      expect(rendered.to_html).to have_css(
        "span",
        text: I18n.t("application.error_summary_component.errors_title", count: account.errors.count)
      )
    end
  end

  context "when record has no errors" do
    it "does not render" do
      account = build_stubbed(:account)
      rendered = render_inline(described_class.new(record: account))

      expect(rendered.to_html).to be_empty
    end
  end
end
