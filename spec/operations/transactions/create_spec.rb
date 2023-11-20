# frozen_string_literal: true

require "rails_helper"

RSpec.describe Transactions::Create, type: :operation do
  describe ".result" do
    context "with valid attributes" do
      it "is successful" do
        account = create(:account)
        category = create(:category)
        attributes = {
          title: "Test",
          amount_cents: 1000,
          transaction_type: TransactionTypes::INCOME,
          transaction_date: Time.zone.today,
          account_id: account.id,
          category_id: category.id
        }
        result = described_class.result(attributes: attributes)

        expect(result).to be_success
      end

      it "creates a new transaction" do
        result = nil
        account = create(:account)
        category = create(:category)
        attributes = {
          title: "Test",
          amount_cents: 1000,
          transaction_type: TransactionTypes::EXPENSE,
          transaction_date: Time.zone.today,
          account_id: account.id,
          category_id: category.id
        }
        expect do
          result = described_class.result(attributes: attributes)
        end.to change(Transaction, :count).by(1)

        expect(result.transaction.attributes).to include(attributes.stringify_keys)
      end

      it "updates account balance" do
        account = create(:account)
        category = create(:category)
        attributes = {
          title: "Test",
          amount_cents: 1000,
          transaction_type: TransactionTypes::EXPENSE,
          transaction_date: Time.zone.today,
          account_id: account.id,
          category_id: category.id
        }

        expect do
          described_class.result(attributes: attributes)
        end.to change { account.reload.balance_cents }.from(0).to(-1000)
      end
    end

    context "with invalid attributes" do
      it "fails" do
        result = described_class.result(attributes: { amount_cents: nil })

        expect(result).to be_failure
      end

      it "returns invalid record" do
        result = described_class.result(attributes: { amount_cents: nil })

        expect(result.transaction).not_to be_valid
      end
    end

    context "when account balance update fails" do
      it "rollbacks transaction creation" do
        account = create(:account)
        category = create(:category)
        attributes = {
          title: "Test",
          amount_cents: 1000,
          transaction_type: TransactionTypes::EXPENSE,
          transaction_date: Time.zone.today,
          account_id: account.id,
          category_id: category.id
        }

        allow(Accounts::UpdateBalance).to receive(:call).with(id: account.id).and_raise("Some error")

        expect { described_class.result(attributes: attributes) }.not_to change(Transaction, :count)
      end
    end
  end
end
