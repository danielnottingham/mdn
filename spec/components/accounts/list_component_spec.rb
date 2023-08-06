# frozen_string_literal: true

require "rails_helper"

RSpec.describe Accounts::ListComponent, type: :component do
  it "renders table accounts title, balance_cents and color" do
    accounts = build_stubbed_list(:account, 3)
    rendered = render_inline(described_class.new(accounts: accounts))

    accounts.each do |account|
      expect(rendered.to_html).to have_text(account.title)
        .and have_text(account.balance_cents)
        .and have_text(account.color)
    end
  end
end
