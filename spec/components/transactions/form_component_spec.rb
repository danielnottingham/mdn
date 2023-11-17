# frozen_string_literal: true

require "rails_helper"

RSpec.describe Transactions::FormComponent, type: :component do
  it "renders the form with the given url" do
    user = create(:user)
    current_accounts = create_list(:account, 2, user: user)
    current_categories = create_list(:category, 2, user: user)
    transaction = Transaction.new(transaction_type: TransactionTypes::EXPENSE, transaction_date: Time.zone.today)

    rendered = render_inline(
      described_class.new(
        transaction: transaction,
        accounts: current_accounts,
        categories: current_categories,
        url: transactions_path
      )
    )

    expect(rendered.to_html).to have_css("form[action='/transactions']")
  end

  context "when the form is for a new record" do
    it "renders the button text with new_transaction_button translation" do
      user = create(:user)
      current_accounts = create_list(:account, 2, user: user)
      current_categories = create_list(:category, 2, user: user)
      transaction = Transaction.new(transaction_type: TransactionTypes::EXPENSE, transaction_date: Time.zone.today)

      rendered = render_inline(
        described_class.new(
          transaction: transaction,
          accounts: current_accounts,
          categories: current_categories,
          url: transactions_path
        )
      )

      expect(rendered.to_html).to have_button(I18n.t(".transactions.form_component.new_transaction_button"))
    end
  end

  context "when the form is for an existing record" do
    it "renders the button text with update_transaction_button translation" do
      user = create(:user)
      current_accounts = create_list(:account, 2, user: user)
      current_categories = create_list(:category, 2, user: user)
      transaction = create(:transaction, account: current_accounts.first, category: current_categories.first)

      rendered = render_inline(
        described_class.new(
          transaction: transaction,
          accounts: current_accounts,
          categories: current_categories,
          url: transactions_path
        )
      )

      expect(rendered.to_html).to have_button(I18n.t(".transactions.form_component.update_transaction_button"))
    end
  end
end
