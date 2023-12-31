# frozen_string_literal: true

require "rails_helper"

RSpec.describe TransactionTypes, type: :enumeration do
  describe ".list" do
    it "returns transactions types" do
      expect(described_class.list).to eq([-1, 1])
    end
  end
end
