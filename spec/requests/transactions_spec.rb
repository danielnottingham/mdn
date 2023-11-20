# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Transactions" do
  describe "GET #index" do
    it "requires authentication" do
      build_stubbed(:transaction)
      get transactions_path

      expect(response).to be_authenticated
    end

    it "returns a successful response" do
      sign_in
      get transactions_path

      expect(response).to have_http_status :ok
    end
  end

  describe "GET #new" do
    it "uses accounts authorized scope" do
      sign_in

      expect { get new_transaction_path }.to have_authorized_scope(:active_record_relation).with(AccountPolicy)
    end

    it "uses categories authorized scope" do
      sign_in

      expect { get new_transaction_path }.to have_authorized_scope(:active_record_relation).with(CategoryPolicy)
    end

    it "requires authentication" do
      get new_transaction_path

      expect(response).to be_authenticated
    end
  end

  describe "POST #create" do
    it "authorizes related data" do
      user = sign_in

      account = create(:account, user: user)
      category = create(:category, user: user)

      expect do
        post transactions_path, params: { transaction: { account_id: account.id, category_id: category.id } }
      end.to(
        be_authorized_to(:show?, account)
        .and(be_authorized_to(:show?, category))
      )
    end

    it "requires authentication" do
      get new_transaction_path

      expect(response).to be_authenticated
    end
  end

  describe "PUT #update" do
    it "authorizes transaction" do
      sign_in

      transaction = create(:transaction)

      expect { put transaction_path(transaction.id) }.to be_authorized_to(:update?, transaction)
    end

    it "authorizes related data" do
      user = sign_in

      account = create(:account, user: user)
      category = create(:category, user: user)
      transaction = create(:transaction, user: user)

      expect do
        put transaction_path(transaction.id),
          params: { transaction: { account_id: account.id, category_id: category.id } }
      end.to(
        be_authorized_to(:show?, account)
        .and(be_authorized_to(:show?, category))
      )
    end

    it "requires authentication" do
      get new_transaction_path

      expect(response).to be_authenticated
    end
  end

  describe "DELETE #destroy" do
    it "authorizes transaction" do
      sign_in

      transaction = create(:transaction)

      expect { delete transaction_path(transaction.id) }.to be_authorized_to(:destroy?, transaction)
    end

    it "requires authentication" do
      get new_transaction_path

      expect(response).to be_authenticated
    end
  end
end
