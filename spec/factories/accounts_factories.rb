# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    user
    sequence(:title) { |n| "Account #{n}" }
    balance_cents { 0 }
    color { "#ffffff" }

    trait :with_transactions do
      transient do
        transactions_count { 3 }
      end

      after(:create) do |account, evaluator|
        create_list(:transaction, evaluator.transactions_count, account: account, user: account.user)
      end
    end
  end
end
