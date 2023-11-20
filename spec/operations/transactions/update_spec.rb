# frozen_string_literal: true

require "rails_helper"

RSpec.describe Transactions::Update, type: :operation do
  describe ".result" do
    context "with valid attributes" do
      it "is successful" do
        transaction = create(:transaction)
        result = described_class.result(id: transaction.id, attributes: { amount_cents: 1000 })

        expect(result).to be_success
      end

      it "updates transaction" do
        transaction = create(:transaction, amount_cents: 1000)
        described_class.result(id: transaction.id, attributes: { amount_cents: 2000 })

        expect(transaction.reload.amount_cents).to eq 2000
      end
    end

    context "when updates amount" do
      it "updates account balance" do
        account = create(:account, balance_cents: -1000)

        transaction = create(:transaction, :expense, account: account, amount_cents: 3000)
        create(:transaction, :income, account: account, amount_cents: 2000)

        expect do
          described_class.result(id: transaction.id, attributes: { amount_cents: 4000 })
        end.to change { account.reload.balance_cents }.from(-1000).to(-2000)
      end
    end

    context "when updates transaction_type" do
      it "updates account balance" do
        account = create(:account, balance_cents: -1000)

        transaction = create(:transaction, :expense, account: account, amount_cents: 3000)
        create(:transaction, :income, account: account, amount_cents: 2000)

        expect do
          described_class.result(id: transaction.id, attributes: { transaction_type: TransactionTypes::INCOME })
        end.to change { account.reload.balance_cents }.from(-1000).to(5000)
      end
    end

    context "when updates account id" do
      it "updates new and previous account's balance" do
        account_a = create(:account, balance_cents: -1000)
        account_b = create(:account, balance_cents: 5000)

        transaction = create(:transaction, :expense, account: account_a, amount_cents: 3000)
        create(:transaction, :income, account: account_a, amount_cents: 2000)
        create(:transaction, :income, account: account_b, amount_cents: 5000)

        expect do
          described_class.result(id: transaction.id, attributes: { account_id: account_b.id })
        end.to(
          change { account_a.reload.balance_cents }.from(-1000).to(2000)
          .and(change { account_b.reload.balance_cents }.from(5000).to(2000))
        )
      end
    end

    context "with invalid attributes" do
      it "fails" do
        transaction = create(:transaction)
        result = described_class.result(id: transaction.id, attributes: { amount_cents: 0 })

        expect(result).to be_failure
      end

      it "returns invalid transaction" do
        transaction = create(:transaction, amount_cents: 2000)
        result = described_class.result(id: transaction.id, attributes: { amount_cents: 0 })

        expect(result.transaction).not_to be_valid
      end
    end

    context "when transaction with given id doesn't exist" do
      it "raises ActiveRecord::RecordNotFound error" do
        expect do
          described_class.result(id: "invalid-id", attributes: { amount_cents: 3000 })
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "when account balance update fails" do
      it "rollbacks transaction update" do
        transaction = create(:transaction, amount_cents: 2000)

        allow(Accounts::UpdateBalance).to receive(:call).with(id: transaction.account_id).and_raise("Some error")

        expect do
          described_class.result(id: transaction.id, attributes: { amount_cents: 3000 })
        end.not_to(change { transaction.reload.amount_cents })
      end
    end
  end
end
