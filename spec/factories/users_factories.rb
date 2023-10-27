# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:full_name) { |i| "John Doe #{i}" }
    email { "john.doe@gmail.com" }
    password { "password" }
  end
end
