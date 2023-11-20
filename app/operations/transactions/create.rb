# frozen_string_literal: true

module Transactions
  class Create < Actor
    input :attributes, type: Hash

    output :transaction, type: Transaction

    def call
      self.transaction = Transaction.new(attributes)

      ActiveRecord::Base.transaction do
        transaction.save!
        Accounts::UpdateBalance.call(id: transaction.account_id)
      rescue StandardError
        fail!(error: :invalid_record)
      end
    end
  end
end
