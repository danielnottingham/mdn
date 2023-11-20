# frozen_string_literal: true

module Transactions
  class Update < Actor
    input :id, type: String
    input :attributes, type: Hash

    output :transaction, type: Transaction

    def call
      self.transaction = Transaction.find(id)

      ActiveRecord::Base.transaction do
        transaction.update!(attributes)
        update_accounts_balance if update_account_balance?
      rescue StandardError
        fail!(error: :invalid_record)
      end
    end

    private

    def update_accounts_balance
      Accounts::UpdateBalance.call(id: transaction.account_id)

      return unless transaction.account_id_previously_changed?

      Accounts::UpdateBalance.call(id: transaction.account_id_previously_was)
    end

    def update_account_balance?
      transaction.amount_cents_previously_changed? ||
        transaction.transaction_type_previously_changed? ||
        transaction.account_id_previously_changed?
    end
  end
end
