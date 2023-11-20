# frozen_string_literal: true

require "rails_helper"

RSpec.describe TransactionPolicy do
  describe "relation_scope" do
    it "returns user transactions" do
      account = create(:account)
      transactions = create_list(:transaction, 3, account: account)
      create_list(:transaction, 2)

      policy = described_class.new(user: account.user)
      scope = policy.apply_scope(Transaction.all, type: :active_record_relation)

      expect(scope.to_a).to match_array(transactions)
    end
  end

  describe "#update?" do
    context "when user is the transaction owner" do
      it "returns true" do
        account = create(:account)
        transaction = create(:transaction, account: account)
        policy = described_class.new(transaction, user: account.user)

        expect(policy.apply(:update?)).to be true
      end
    end

    context "when user isn't the transaction owner" do
      it "returns false" do
        user = create(:user)
        transaction = create(:transaction)
        policy = described_class.new(transaction, user: user)

        expect(policy.apply(:update?)).to be false
      end
    end
  end

  describe "#destroy?" do
    context "when user is the transaction owner" do
      it "returns true" do
        account = create(:account)
        transaction = create(:transaction, account: account)
        policy = described_class.new(transaction, user: account.user)

        expect(policy.apply(:destroy?)).to be true
      end
    end

    context "when use isn't the record owner" do
      it "returns false" do
        user = create(:user)
        transaction = create(:transaction)
        policy = described_class.new(transaction, user: user)

        expect(policy.apply(:destroy?)).to be false
      end
    end
  end
end
