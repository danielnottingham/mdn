# frozen_string_literal: true

module Accounts
  class UpdateBalance < Actor
    input :id, type: String

    def call
      account = Account.find(id)
      balance_cents = Transaction.where(account_id: id).sum("transactions.amount_cents * transactions.transaction_type")

      fail!(error: :invalid_record) unless account.update(balance_cents: balance_cents)
    end
  end
end
