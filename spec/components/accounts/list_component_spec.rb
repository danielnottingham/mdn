# frozen_string_literal: true

require "rails_helper"

RSpec.describe Accounts::ListComponent, type: :component do
  it "renders accounts with title, balance_cents and color" do
    user = create(:user)
    accounts = create_list(:account, 3, user: user)
    rendered = render_inline(described_class.new(accounts: accounts))

    accounts.each do |account|
      expect(rendered.to_html).to have_text(account.title)
        .and have_text(account.balance_cents)
        .and have_link(I18n.t("accounts.list_component.edit"), href: edit_account_path(account.id))
        .and have_link(I18n.t("accounts.list_component.show"), href: account_path(account.id))
    end
  end
end
