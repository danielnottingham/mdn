# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    title { "Some transaction" }
    amount_cents { 1 }
    amount_currency { "BRL" }
    transaction_date { "2023-11-08" }
    transaction_type { TransactionTypes::EXPENSE }
    payee { "Someone" }

    transient { user { create(:user) } } # rubocop:disable FactoryBot/FactoryAssociationWithStrategy
    account { association :account, user: user }
    category { association :category, user: user }

    trait :income do
      transaction_type { TransactionTypes::INCOME }
    end
    trait :expense do
      transaction_type { TransactionTypes::EXPENSE }
    end
    traits_for_enum(:transaction_type, TransactionTypes.list)
  end
end
