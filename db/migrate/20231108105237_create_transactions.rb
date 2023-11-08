# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :transactions, id: :uuid do |t|
      t.string :title, null: false
      t.integer :amount_cents, default: 0, null: false
      t.string :amount_currency, default: "BRL", null: false
      t.date :transaction_date, null: false
      t.string :transaction_type, null: false
      t.string :payee, limit: 40
      t.string :description, limit: 50
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.references :category, null: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
