# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Transaction destroy" do
  context "when transaction can be destroyed" do
    it "destroys transaction" do
      account = create(:account)
      transaction = create(:transaction, account: account, amount_cents: 5000)

      sign_in(account.user)
      visit transactions_path
      click_link href: edit_transaction_path(transaction)

      expect(page).to have_css("h2", text: transaction.title)

      click_button(I18n.t("transactions.edit_page.destroy"))
      page.accept_alert(text: I18n.t("transactions.edit_page.destroy_confirm"))

      expect(page).to have_css("h2", text: I18n.t("transactions.index_page.header_title"))
      expect(page).to have_text(I18n.t("transactions.destroy.success"))
    end
  end

  context "when transaction cannot be destroyed" do
    it "shows error message" do
      account = create(:account)
      transaction = create(:transaction, account: account, amount_cents: 5000)

      sign_in(account.user)
      visit transactions_path
      click_link href: edit_transaction_path(transaction)

      expect(page).to have_css("h2", text: transaction.title)

      allow(Transactions::Destroy).to receive(:result)
        .and_return(ServiceActor::Result.new(failure?: true, transaction: transaction))

      click_button(I18n.t("transactions.edit_page.destroy"))
      page.accept_alert(text: I18n.t("transactions.edit_page.destroy_confirm"))

      expect(page).to have_css("h2", text: transaction.title)
      expect(page).to have_text(I18n.t("transactions.destroy.error"))
    end
  end
end
