# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Transaction update" do
  context "with valid info" do
    it "update transaction info" do
      account = create(:account)
      transaction = create(:transaction, account: account, amount_cents: 5000)

      sign_in(account.user)
      visit transactions_path
      click_link href: edit_transaction_path(transaction)

      expect(page).to have_css("h2", text: transaction.title)

      fill_in I18n.t("activerecord.attributes.transaction.amount_cents"), with: "3000"
      click_button I18n.t(".transactions.form_component.update_transaction_button")

      expect(page).to have_text(I18n.t("transactions.update.success"))
      expect(page).to have_css("div", text: "R$30,00")
    end
  end

  context "with invalid info" do
    it "renders input errors" do
      account = create(:account)
      transaction = create(:transaction, account: account, amount_cents: 5000)

      sign_in(account.user)
      visit transactions_path
      click_link href: edit_transaction_path(transaction)

      expect(page).to have_css("h2", text: transaction.title)

      fill_in I18n.t("activerecord.attributes.transaction.amount_cents"), with: "0"
      click_button I18n.t(".transactions.form_component.update_transaction_button")

      expect(page).to have_form_errors(quantity: 1)
    end
  end
end
