# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :success, :error, :warning, :info

  private

  def current_accounts
    scope = authorized_scope(Account.all, with: AccountPolicy)
    Accounts::List.result(scope: scope).accounts
  end

  def current_categories
    scope = authorized_scope(Category.all, with: CategoryPolicy)
    Categories::List.result(scope: scope).categories
  end
end
