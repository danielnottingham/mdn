# frozen_string_literal: true

class Transaction < ApplicationRecord
  has_enumeration_for :transaction_type, with: TransactionTypes, create_helpers: true

  belongs_to :account
  belongs_to :category, optional: true

  validates :title, presence: true
  validates :amount_cents, presence: true
  validates :amount_currency, presence: true
  validates :transaction_date, presence: true
  validates :transaction_type, presence: true

  validates :amount_cents, numericality: { greater_than: 0 }

  validates :payee, length: { maximum: 40 }
  validates :description, length: { maximum: 50 }

  monetize :amount
end
