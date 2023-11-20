# frozen_string_literal: true

require "rails_helper"

RSpec.describe Transactions::ListComponent, type: :component do
  it "renders transactions with title, amount_cents and created_at" do
    user = create(:user)
    account = create(:account, user: user)
    transactions = create_list(:transaction, 3, account: account)
    rendered = render_inline(described_class.new(transactions: transactions))

    transactions.each do |transaction|
      expect(rendered.to_html).to have_text(transaction.title)
        .and have_text(transaction.amount_cents)
        .and have_text(transaction.created_at.strftime("%d %b %y"))
    end
  end
end
