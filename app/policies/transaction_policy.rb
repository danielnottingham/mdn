# frozen_string_literal: true

class TransactionPolicy < ApplicationPolicy
  relation_scope do |relation|
    relation.includes(account: :user).where(users: { id: user.id })
  end
end
