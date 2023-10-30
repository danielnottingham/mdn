# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Account create" do
  context "with valid form" do
    it "creates a new account" do
      sign_in
      visit accounts_path

      click_link href: new_account_path

      expect(page).to have_css("h2", text: I18n.t("accounts.new_page.header_title"))

      fill_in I18n.t("activerecord.attributes.account.title"), with: "My Account title"
      fill_in I18n.t("activerecord.attributes.account.balance_cents"), with: "100"
      fill_in I18n.t("activerecord.attributes.account.color"), with: "#ffffff"
      click_button I18n.t(".accounts.form_component.new_account_button")

      expect(page).to have_css("h2", text: I18n.t("accounts.index_page.header_title"))
      expect(page).to have_text(I18n.t("accounts.create.success"))
    end
  end

  context "with invalid form" do
    it "does not create a new account" do
      sign_in
      visit accounts_path

      click_link href: new_account_path

      expect(page).to have_css("h2", text: I18n.t("accounts.new_page.header_title"))

      fill_in I18n.t("activerecord.attributes.account.title"), with: ""
      fill_in I18n.t("activerecord.attributes.account.balance_cents"), with: ""
      fill_in I18n.t("activerecord.attributes.account.color"), with: "#ffffff"
      click_button I18n.t(".accounts.form_component.new_account_button")

      expect(page).to have_form_errors(quantity: 2)
      expect(page).to have_css("h2", text: I18n.t("accounts.new_page.header_title"))
    end
  end
end
