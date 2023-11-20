# frozen_string_literal: true

module Transactions
  class Destroy < Actor
    input :id, type: String

    output :transaction, type: Transaction

    def call
      self.transaction = Transaction.find(id)

      ActiveRecord::Base.transaction do
        transaction.destroy!
        Accounts::UpdateBalance.call(id: transaction.account_id)
      rescue StandardError
        fail!(error: :cannot_destroy)
      end
    end
  end
end
