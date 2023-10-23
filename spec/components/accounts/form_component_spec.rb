# frozen_string_literal: true

require "rails_helper"

RSpec.describe Accounts::FormComponent, type: :component do
  it "renders the form with the given url" do
    rendered = render_inline(described_class.new(account: Account.new, url: "/submit_url"))

    expect(rendered.to_html).to have_css("form[action='/submit_url']")
  end

  context "when the form is for a new record" do
    it "renders the button text with new_account_button translation" do
      rendered = render_inline(described_class.new(account: Account.new, url: "/submit_url"))

      expect(rendered.to_html).to have_button(I18n.t(".accounts.form_component.new_account_button"))
    end
  end

  context "when the form is for an existing record" do
    it "renders the button text with update_account_button translation" do
      account = create(:account)

      rendered = render_inline(described_class.new(account: account, url: "/submit_url"))

      expect(rendered.to_html).to have_button(I18n.t(".accounts.form_component.update_account_button"))
    end
  end
end
