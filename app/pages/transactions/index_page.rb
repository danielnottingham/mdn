# frozen_string_literal: true

module Transactions
  class IndexPage < ApplicationPage
    attr_reader :transactions, :current_user

    def initialize(transactions:, current_user:)
      @transactions = transactions
      @current_user = current_user
    end
  end
end
