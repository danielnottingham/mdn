# frozen_string_literal: true

module Transactions
  class List < Actor
    input :scope, type: ActiveRecord::Relation, default: -> { Transaction.all }

    output :transactions, type: Enumerable

    def call
      self.transactions = scope.order(transaction_date: :desc, created_at: :desc)
    end
  end
end
