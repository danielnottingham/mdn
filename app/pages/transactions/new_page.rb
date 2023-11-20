# frozen_string_literal: true

module Transactions
  class NewPage < ApplicationPage
    attr_reader :transaction, :accounts, :categories, :current_user

    def initialize(transaction:, accounts:, categories:, current_user:)
      @transaction = transaction
      @accounts = accounts
      @categories = categories
      @current_user = current_user
    end
  end
end
