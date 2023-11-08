# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Accounts" do
  describe "GET #index" do
    it "requires authentication" do
      build_stubbed(:account)
      get accounts_path

      expect(response).to be_authenticated
    end

    it "returns a successful response" do
      sign_in
      get accounts_path

      expect(response).to have_http_status :ok
    end
  end

  describe "GET #show" do
    it "requires authentication" do
      account = create(:account)
      get account_path(account)

      expect(response).to be_authenticated
    end

    it "authorizes account" do
      sign_in
      account = create(:account)

      expect { get account_path(account) }.to be_authorized_to(:show?, account)
    end
  end

  describe "GET #new" do
    it "requires authentication" do
      get new_account_path

      expect(response).to be_authenticated
    end

    it "returns a successful response" do
      sign_in
      get new_account_path

      expect(response).to have_http_status :ok
    end
  end

  describe "GET #edit" do
    it "requires authentication" do
      account = create(:account)
      get edit_account_path(account)

      expect(response).to be_authenticated
    end

    it "authorizes account" do
      sign_in
      account = create(:account)

      expect { get edit_account_path(account) }.to be_authorized_to(:update?, account)
    end
  end

  describe "POST #create" do
    it "requires authentication" do
      post accounts_path

      expect(response).to be_authenticated
    end
  end

  describe "PUT #update" do
    it "authorizes account" do
      sign_in
      account = create(:account)

      expect { put account_path(account.id) }.to be_authorized_to(:update?, account)
    end

    it "requires authentication" do
      account = create(:account)
      put account_path(account)

      expect(response).to be_authenticated
    end
  end

  describe "DELETE #destroy" do
    it "authorizes account" do
      sign_in
      account = create(:account)

      expect { delete account_path(account) }.to be_authorized_to(:destroy?, account)
    end

    it "requires authentication" do
      account = create(:account)
      delete account_path(account)

      expect(response).to be_authenticated
    end
  end
end
