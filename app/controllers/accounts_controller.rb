# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    result = Accounts::List.result(scope: Account.all)

    respond_to do |format|
      format.html { render Accounts::IndexPage.new(accounts: result.accounts) }
    end
  end

  def new
    respond_to do |format|
      format.html { render Accounts::NewPage.new(account: Account.new) }
    end
  end

  def create
    result = Accounts::Create.result(attributes: account_params)

    if result.success?
      respond_to do |format|
        format.html { redirect_to accounts_path }
      end
    else
      respond_to do |format|
        format.html { render Accounts::NewPage.new(account: result.account), status: :unprocessable_entity }
      end
    end
  end

  private

  def account_params
    params.require(:account).permit(:title, :balance_cents, :color).to_h
  end
end
