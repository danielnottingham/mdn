# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Account update" do
  context "with valid form" do
    it "updates an account" do
      user = create(:user)
      account = create(:account, title: "Old title", user: user)

      sign_in(user)
      visit accounts_path

      click_link href: edit_account_path(account)

      expect(page).to have_css("h2", text: I18n.t("accounts.edit_page.header_title"))

      fill_in I18n.t("activerecord.attributes.account.title"), with: "New title"
      click_button I18n.t(".accounts.form_component.update_account_button")

      expect(page).to have_text(I18n.t("accounts.update.success"))
      expect(page).to have_css("div", text: "New title")
    end
  end

  context "with invalid form" do
    it "does not update an account" do
      user = create(:user)
      account = create(:account, title: "Old title", user: user)

      sign_in(user)
      visit accounts_path

      click_link href: edit_account_path(account)

      expect(page).to have_css("h2", text: I18n.t("accounts.edit_page.header_title"))

      fill_in I18n.t("activerecord.attributes.account.title"), with: ""
      click_button I18n.t(".accounts.form_component.update_account_button")

      expect(page).to have_form_errors(quantity: 1)
    end
  end
end
