# frozen_string_literal: true

require "rails_helper"

RSpec.describe Transactions::Find, type: :operation do
  describe ".result" do
    context "when transaction with given id exists" do
      it "is successful" do
        transaction = create(:transaction)
        result = described_class.result(id: transaction.id)

        expect(result).to be_success
      end

      it "returns found transaction" do
        transaction = create(:transaction)
        result = described_class.result(id: transaction.id)

        expect(result.transaction).to eq transaction
      end
    end

    context "when transaction with given id doesn't exist" do
      it "raises ActiveRecord::RecordNotFound error" do
        expect { described_class.result(id: "invalid-id") }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
