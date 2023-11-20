# frozen_string_literal: true

module Transactions
  class Find < Actor
    input :id, type: String

    output :transaction, type: Transaction

    def call
      self.transaction = Transaction.find(id)
    end
  end
end
