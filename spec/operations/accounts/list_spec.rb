# frozen_string_literal: true

require "rails_helper"

RSpec.describe Accounts::List, type: :operation do
  it "returns accounts ordered by creation date DESC" do
    user = create(:user)
    nubank_account = create(:account, created_at: Time.zone.yesterday, user: user)
    cora_account = create(:account, created_at: Time.zone.tomorrow, user: user)
    inter_account = create(:account, created_at: Time.zone.today, user: user)

    result = described_class.result

    expect(result.accounts.to_a).to eq [cora_account, inter_account, nubank_account]
  end

  it "accepts scope" do
    user = create(:user)
    first_accounts = create_list(:account, 3, created_at: Time.zone.yesterday, user: user)
    create_list(:account, 3, created_at: Time.zone.tomorrow, user: user)

    result = described_class.result(scope: Account.where(created_at: ..Time.zone.today))

    expect(result.accounts.to_a).to match_array(first_accounts)
  end
end
