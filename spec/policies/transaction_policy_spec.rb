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
end
