# frozen_string_literal: true

class AccountsController < ApplicationController
  def new
    render Accounts::NewPage.new(account: Account.new)
  end

  private

  def account_params
    params.require(:account).permit(:title, :balance_cents, :color)
  end
end
