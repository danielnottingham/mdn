# frozen_string_literal: true

require "rails_helper"

RSpec.describe Transactions::Destroy, type: :operation do
  describe ".result" do
    context "when transaction can be destroyed" do
      it "is successful" do
        transaction = create(:transaction)
        result = described_class.result(id: transaction.id)

        expect(result).to be_success
      end

      it "destroys transaction" do
        transaction = create(:transaction)
        result = described_class.result(id: transaction.id)

        expect(result.transaction).to be_destroyed
      end

      it "updates account balance" do
        account = create(:account, balance_cents: -1500)

        transaction = create(:transaction, :income, account: account, amount_cents: 1500)
        create(:transaction, :expense, account: account, amount_cents: 3000)

        expect do
          described_class.result(id: transaction.id)
        end.to change { account.reload.balance_cents }.from(-1500).to(-3000)
      end
    end

    context "when transaction cannot be destroyed" do
      it "fails" do
        transaction = create(:transaction)
        allow(Transaction).to receive(:find).with(transaction.id).and_return(transaction)
        allow(transaction).to receive(:destroy).and_return(false)

        result = described_class.result(id: transaction.id)

        expect(result).to be_failure
      end

      it "returns transaction" do
        transaction = create(:transaction)
        allow(Transaction).to receive(:find).with(transaction.id).and_return(transaction)
        allow(transaction).to receive(:destroy).and_return(false)

        result = described_class.result(id: transaction.id)

        expect(result.transaction).not_to be_destroyed
      end
    end

    context "when transaction with given id doesn't exist" do
      it "raises ActiveRecord::RecordNotFound error" do
        expect { described_class.result(id: "invalid-id") }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "when account balance update fails" do
      it "rollbacks transaction destruction" do
        transaction = create(:transaction)
        allow(Accounts::UpdateBalance).to receive(:call).with(id: transaction.account_id).and_raise("Some error")

        expect { described_class.result(id: transaction.id) }.not_to change(Transaction, :count)
      end
    end
  end
end
