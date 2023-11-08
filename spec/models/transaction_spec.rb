# frozen_string_literal: true

require "rails_helper"

RSpec.describe Transaction do
  describe "associations" do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to belong_to(:category).optional }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:amount_cents) }
    it { is_expected.to validate_presence_of(:amount_currency) }
    it { is_expected.to validate_presence_of(:transaction_date) }
    it { is_expected.to validate_presence_of(:transaction_type) }

    it { is_expected.to validate_numericality_of(:amount_cents).is_greater_than(0) }

    it { is_expected.to validate_length_of(:payee).is_at_most(40) }
    it { is_expected.to validate_length_of(:description).is_at_most(50) }
  end

  describe "monetization" do
    it "monetizes amount attributes" do
      transaction = described_class.new(amount_cents: 10, amount_currency: "USD")

      expect(transaction.amount).to eq Money.new(10, "USD")
    end
  end

  describe ".enumerations" do
    it "has enumerations for transaction_type" do
      expect(described_class.enumerations).to include(transaction_type: TransactionTypes)
    end
  end
end
