# frozen_string_literal: true

require "rails_helper"

RSpec.describe Transactions::CardComponent, type: :component do
  it "renders with title, amount_cents transaction_date and category title" do
    user = create(:user)
    account = create(:account, user: user)
    transaction = create(:transaction, account: account)
    rendered = render_inline(described_class.new(transaction: transaction))

    expect(rendered.to_html).to have_text(transaction.title)
      .and have_text(transaction.amount_cents)
      .and have_text(transaction.category.title)
      .and have_text(transaction.transaction_date.strftime("%d %b %y"))
  end
end
