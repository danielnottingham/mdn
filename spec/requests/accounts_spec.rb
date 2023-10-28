# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Accounts" do
  describe "GET #index" do
    context "when user is logged in" do
      it "returns a successful response" do
        sign_in
        get accounts_path

        expect(response).to have_http_status :ok
      end
    end

    context "when user is not logged in" do
      it "returns a redirect response" do
        get accounts_path

        expect(response).to have_http_status :redirect
      end
    end
  end

  describe "GET #new" do
    context "when user is logged in" do
      it "returns a successful response" do
        sign_in
        get new_account_path

        expect(response).to have_http_status :ok
      end
    end

    context "when user is not logged in" do
      it "returns a redirect response" do
        get new_account_path

        expect(response).to have_http_status :redirect
      end
    end
  end

  describe "GET #edit" do
    context "when user is logged in" do
      it "returns a successful response" do
        sign_in
        account = create(:account)
        get edit_account_path(account)

        expect(response).to have_http_status :ok
      end
    end

    context "when user is not logged in" do
      it "returns a redirect response" do
        account = create(:account)
        get edit_account_path(account)

        expect(response).to have_http_status :redirect
      end
    end
  end
end
