# frozen_string_literal: true

require "rails_helper"

RSpec.describe Accounts::Update, type: :operation do
  context "with valid attributes" do
    it "is successful" do
      account = create(:account)
      result = described_class.result(id: account.id, attributes: { title: "New title", balance_cents: 12 })

      expect(result).to be_success
    end

    it "updates account" do
      account = create(:account, title: "Old title", balance_cents: 3)
      described_class.result(id: account.id, attributes: { title: "New title", balance_cents: 12 })

      expect(account.reload.attributes).to include(
        "title" => "New title",
        "balance_cents" => 12
      )
    end
  end

  context "with invalid attributes" do
    it "fails" do
      account = create(:account)
      result = described_class.result(id: account.id, attributes: { title: "" })

      expect(result).to be_failure
    end

    it "returns invalid account" do
      account = create(:account, title: "Old title")
      result = described_class.result(id: account.id, attributes: { title: "" })

      expect(result.account).not_to be_valid
    end

    it "doesn't updates account with given id" do
      account = create(:account, title: "Old title", balance_cents: 12)
      attributes = { title: nil, balance_cents: 25 }

      result = described_class.result(id: account.id, attributes: attributes)

      expect(result.account.reload.balance_cents).to eq 12
    end
  end

  context "when account with given id doesn't exist" do
    it "raises ActiveRecord::RecordNotFound error" do
      expect do
        described_class.result(id: "invalid-id", attributes: { title: "New title" })
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
