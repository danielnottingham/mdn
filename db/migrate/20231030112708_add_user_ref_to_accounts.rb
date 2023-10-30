# frozen_string_literal: true

class AddUserRefToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_reference :accounts, :user, null: false, foreign_key: true, type: :uuid, index: true # rubocop:disable Rails/NotNullColumn
    add_index :accounts, %i[user_id title], unique: true
  end
end
