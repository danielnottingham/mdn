# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    scope = authorized_scope(Transaction.all, with: TransactionPolicy)
    authorized_transactions_scope = Transactions::List.result(scope: scope).transactions

    result = Transactions::List.result(scope: authorized_transactions_scope)

    render Transactions::IndexPage.new(transactions: result.transactions, current_user: current_user)
  end
end
