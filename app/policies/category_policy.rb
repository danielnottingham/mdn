# frozen_string_literal: true

class CategoryPolicy < ApplicationPolicy
  relation_scope do |relation|
    relation.where(user: user)
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end
end
