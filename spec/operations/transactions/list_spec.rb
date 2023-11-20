# frozen_string_literal: true

require "rails_helper"

RSpec.describe Transactions::List, type: :operation do
  describe ".result" do
    it "returns transactions ordered by transaction_date date DESC and created_at DESC" do
      transaction_4 = create(:transaction, transaction_date: Time.zone.yesterday)
      transaction_1 = create(:transaction, transaction_date: Time.zone.tomorrow)
      transaction_2 = create(:transaction, transaction_date: Time.zone.today, created_at: Time.zone.today)
      transaction_3 = create(:transaction, transaction_date: Time.zone.today, created_at: Time.zone.yesterday)

      result = described_class.result

      expect(result.transactions.to_a).to eq [transaction_1, transaction_2, transaction_3, transaction_4]
    end

    it "accepts scope" do
      old_transactions = create_list(:transaction, 3, created_at: Time.zone.yesterday)
      create_list(:transaction, 3, created_at: Time.zone.tomorrow)

      result = described_class.result(scope: Transaction.where(created_at: ..Time.zone.today))

      expect(result.transactions.to_a).to match_array(old_transactions)
    end
  end
end
