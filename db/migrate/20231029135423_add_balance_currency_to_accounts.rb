# frozen_string_literal: true

class AddBalanceCurrencyToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :balance_currency, :string, null: false, default: "BRL"
  end
end
