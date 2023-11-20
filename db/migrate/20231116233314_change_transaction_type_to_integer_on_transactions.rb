# frozen_string_literal: true

class ChangeTransactionTypeToIntegerOnTransactions < ActiveRecord::Migration[7.1]
  def change
    change_column :transactions, :transaction_type, :integer, using: "transaction_type::integer" # rubocop:disable Rails/ReversibleMigration
  end
end
