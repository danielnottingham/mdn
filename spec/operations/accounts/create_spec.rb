# frozen_string_literal: true

require "rails_helper"

RSpec.describe Accounts::Create, type: :operation do
  describe ".result" do
    context "with valid attributes" do
      it "is successful" do
        attributes = { title: "My account", balance_cents: "200", color: "#ffffff" }
        result = described_class.result(attributes: attributes)

        expect(result).to be_success
      end

      it "creates a new account" do
        result = nil
        attributes = { title: "My account", balance_cents: "200", color: "#ffffff" }

        expect do
          result = described_class.result(attributes: attributes)
        end.to change(Account, :count).by(1)

        expect(result.account.attributes).to include(
          { "title" => "My account", "balance_cents" => 200, "color" => "#ffffff" }
        )
      end
    end

    context "with invalid attributes" do
      it "fails" do
        result = described_class.result(attributes: { title: nil })

        expect(result).to be_failure
      end

      it "returns invalid account" do
        result = described_class.result(attributes: { title: nil })

        expect(result.account).not_to be_valid
      end
    end
  end
end
