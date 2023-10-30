# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Account destroy" do
  context "when account can be destroyed" do
    it "destroys account" do
      user = create(:user)
      account = create(:account, user: user, title: "My account")

      sign_in(user)
      visit accounts_path
      click_link href: edit_account_path(account)

      expect(page).to have_css("h2", text: I18n.t("accounts.edit_page.header_title"))

      click_button(I18n.t("accounts.edit_page.destroy"))
      page.accept_alert(text: I18n.t("accounts.edit_page.destroy_confirm"))

      expect(page).to have_css("h2", text: I18n.t("accounts.index_page.header_title"))
      expect(page).to have_text(I18n.t("accounts.destroy.success"))
    end
  end

  context "when account cannot be destroyed" do
    it "shows error message" do
      user = create(:user)
      account = create(:account, user: user, title: "My account")

      sign_in(user)
      visit accounts_path
      click_link href: edit_account_path(account)

      allow(Accounts::Destroy).to receive(:result)
        .and_return(ServiceActor::Result.new(failure?: true, account: account))

      click_button(I18n.t("accounts.edit_page.destroy"))
      page.accept_alert(text: I18n.t("accounts.edit_page.destroy_confirm"))

      expect(page).to have_css("h2", text: I18n.t("accounts.edit_page.header_title"))
      expect(page).to have_text(I18n.t("accounts.destroy.error"))
    end
  end
end
