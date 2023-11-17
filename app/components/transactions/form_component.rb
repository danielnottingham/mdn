# frozen_string_literal: true

module Transactions
  class FormComponent < ViewComponent::Base
    attr_reader :transaction, :accounts, :categories, :url

    def initialize(transaction:, accounts:, categories:, url:)
      @transaction = transaction
      @accounts = accounts
      @categories = categories
      @url = url
    end

    private

    def submit_button(form)
      return form.mdn_submit t(".new_transaction_button") if transaction.new_record?

      form.mdn_submit t(".update_transaction_button")
    end
  end
end
