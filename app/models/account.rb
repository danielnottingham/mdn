# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user

  has_many :transactions, dependent: :destroy

  validates :title, presence: true
  validates :balance_cents, presence: true
  validates :balance_currency, presence: true
  validates :color, presence: true

  validates :title, uniqueness: { scope: :user_id }

  validates :title, length: { maximum: 50 }

  validates :color, format: { with: /\A#[a-fA-F0-9]{6}\z/ }

  monetize :balance
end
