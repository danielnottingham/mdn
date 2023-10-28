# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Accounts" do
  describe "#create" do
    context "with valid form" do
      it "creates a new account" do
        sign_in
        visit new_account_path
        fill_in "Título", with: "My Account"
        fill_in "Saldo", with: "100"
        fill_in "Cor", with: "#ffffff"
        click_button "Criar conta"

        expect(page).to have_text(I18n.t("accounts.create.success"))
      end
    end

    context "with invalid form" do
      it "does not create a new account" do
        sign_in
        visit new_account_path
        fill_in "Título", with: ""
        fill_in "Saldo", with: ""
        fill_in "Cor", with: "#ffffff"
        click_button "Criar conta"

        expect(page).to have_form_errors(quantity: 2)
      end
    end
  end

  describe "#update" do
    context "with valid form" do
      it "updates an account" do
        sign_in
        account = create(:account, title: "Nubank account")
        visit edit_account_path(account)
        fill_in "Título", with: "Inter account"
        fill_in "Saldo", with: "100"
        fill_in "Cor", with: "#ffffff"
        click_button "Atualizar conta"

        expect(page).to have_text(I18n.t("accounts.update.success"))
      end
    end

    context "with invalid form" do
      it "does not update an account" do
        sign_in
        account = create(:account, title: "Nubank account")
        visit edit_account_path(account)
        fill_in "Título", with: ""
        fill_in "Saldo", with: "100"
        fill_in "Cor", with: "#ffffff"
        click_button "Atualizar conta"

        expect(page).to have_form_errors(quantity: 1)
      end
    end
  end

  describe "#destroy" do
    it "destroys an account" do
      sign_in
      account = create(:account)

      visit edit_account_path(account)
      click_button "Excluir conta"

      expect(page).to have_text(I18n.t("accounts.destroy.success"))
    end

    it "returns a flash message" do
      sign_in
      account = create(:account)
      allow(Account).to receive(:find).with(account.id.to_s).and_return(account)
      allow(account).to receive(:destroy).and_return(false)

      visit edit_account_path(account)
      click_button "Excluir conta"

      expect(page).to have_text(I18n.t(".accounts.destroy.error"))
    end
  end
end
