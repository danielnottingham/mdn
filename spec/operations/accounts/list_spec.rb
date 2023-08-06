# frozen_string_literal: true

require "rails_helper"

RSpec.describe Accounts::List, type: :operation do
  it "returns accounts ordered by creation date DESC" do
    nubank_account = create(:account, created_at: Time.zone.yesterday)
    cora_account = create(:account, created_at: Time.zone.tomorrow)
    inter_account = create(:account, created_at: Time.zone.today)

    result = described_class.result

    expect(result.accounts.to_a).to eq [cora_account, inter_account, nubank_account]
  end
end
