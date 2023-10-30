# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    user
    sequence(:title) { |n| "Account #{n}" }
    balance_cents { 0 }
    color { "#ffffff" }
  end
end
