# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    result = Accounts::List.result(scope: Account.all)

    render Accounts::IndexPage.new(accounts: result.accounts)
  end

  def new
    render Accounts::NewPage.new(account: Account.new)
  end

  def edit
    render Accounts::EditPage.new(account: account)
  end

  def create
    result = Accounts::Create.result(attributes: account_params)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      render Accounts::NewPage.new(account: result.account), status: :unprocessable_entity
    end
  end

  def update
    result = Accounts::Update.result(id: params[:id], attributes: account_params)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      render Accounts::EditPage.new(account: result.account), status: :unprocessable_entity
    end
  end

  private

  def account
    @account ||= Accounts::Find.result(id: params[:id]).account
  end

  def account_params
    params.require(:account).permit(:title, :balance_cents, :color).to_h
  end
end
