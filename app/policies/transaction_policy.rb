# frozen_string_literal: true

class TransactionPolicy < ApplicationPolicy
  relation_scope do |relation|
    relation.joins(:account).where(accounts: { user_id: user.id })
  end
end
