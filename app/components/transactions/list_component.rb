# frozen_string_literal: true

module Transactions
  class ListComponent < ViewComponent::Base
    attr_accessor :transactions

    def initialize(transactions:)
      @transactions = transactions
    end

    private

    def render?
      transactions.any?
    end
  end
end
