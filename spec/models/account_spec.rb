# frozen_string_literal: true

require "rails_helper"

RSpec.describe Account do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:balance_cents) }
    it { is_expected.to validate_presence_of(:balance_currency) }
    it { is_expected.to validate_presence_of(:color) }

    it do
      account = create(:account)
      expect(account).to validate_uniqueness_of(:title).scoped_to(:user_id)
    end

    it { is_expected.to validate_length_of(:title).is_at_most(50) }

    it { is_expected.to allow_value("#FF00aa").for(:color) }
    it { is_expected.not_to allow_value("FF00aa").for(:color) }
    it { is_expected.not_to allow_value("#fff").for(:color) }
    it { is_expected.not_to allow_value("#ff00aaff").for(:color) }
    it { is_expected.not_to allow_value("#ff00zz").for(:color) }
    it { is_expected.not_to allow_value("random value").for(:color) }
  end

  describe "monetization" do
    it "monetizes balance attributes" do
      account = described_class.new(balance_cents: 10, balance_currency: "USD")

      expect(account.balance).to eq Money.new(10, "USD")
    end
  end
end
