# frozen_string_literal: true

module Transactions
  class CardComponent < ViewComponent::Base
    attr_reader :transaction

    def initialize(transaction:)
      @transaction = transaction
    end

    private

    def transaction_color
      transaction.expense? ? "#ef4444" : "#22c55e"
    end

    def amount_formated
      transaction.expense? ? "-#{transaction.amount.format}" : "+#{transaction.amount.format}"
    end

    def transaction_category_color
      transaction&.category&.color
    end

    def category_title
      transaction&.category&.title || "Sem categoria"
    end
  end
end
