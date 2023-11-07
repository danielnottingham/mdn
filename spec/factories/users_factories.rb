# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:full_name) { |i| "John Doe #{i}" }
    sequence(:email) { |i| "john_doe_#{i}@gmail.com" }
    password { "password" }
  end
end
