# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Transaction create" do
  context "with valid info" do
    it "creates a new transaction" do
      user = sign_in
      account = create(:account, user: user)
      category = create(:category, user: user)

      visit transactions_path(as: user)

      click_link I18n.t("transactions.index_page.new_transaction")

      expect(page).to have_css("h2", text: I18n.t("transactions.new_page.header_title"))

      find("label[for='transaction_transaction_type_#{TransactionTypes::INCOME}'").click
      fill_in I18n.t("activerecord.attributes.transaction.title"), with: "Some title"
      fill_in I18n.t("activerecord.attributes.transaction.amount_cents"), with: "2000"
      select account.title, from: "transaction_account_id"
      select category.title, from: "transaction_category_id"
      fill_in I18n.t("activerecord.attributes.transaction.transaction_date"), with: "2020-01-01"
      fill_in I18n.t("activerecord.attributes.transaction.payee"), with: "Some Payee"
      fill_in I18n.t("activerecord.attributes.transaction.description"), with: "My description"

      click_button I18n.t(".transactions.form_component.new_transaction_button")

      expect(page).to have_css("h2", text: I18n.t("transactions.index_page.header_title"))
      expect(page).to have_text(I18n.t("transactions.create.success"))
    end
  end

  context "with invalid info" do
    it "renders input errors" do
      user = sign_in

      visit transactions_path(as: user)

      click_link I18n.t("transactions.index_page.new_transaction")

      expect(page).to have_css("h2", text: I18n.t("transactions.new_page.header_title"))

      fill_in I18n.t("activerecord.attributes.transaction.amount_cents"), with: "0"

      click_button I18n.t(".transactions.form_component.new_transaction_button")

      expect(page).to have_form_errors(quantity: 3)
      expect(page).to have_css("h2", text: I18n.t("transactions.new_page.header_title"))
    end
  end
end
