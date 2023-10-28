# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    result = Accounts::List.result(scope: Account.all)

    render Accounts::IndexPage.new(accounts: result.accounts, current_user: current_user)
  end

  def new
    render Accounts::NewPage.new(account: Account.new, current_user: current_user)
  end

  def edit
    render Accounts::EditPage.new(account: account, current_user: current_user)
  end

  def create
    result = Accounts::Create.result(attributes: account_params)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      render Accounts::NewPage.new(account: result.account, current_user: current_user), status: :unprocessable_entity
    end
  end

  def update
    result = Accounts::Update.result(id: params[:id], attributes: account_params)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      render Accounts::EditPage.new(account: result.account, current_user: current_user), status: :unprocessable_entity
    end
  end

  def destroy
    result = Accounts::Destroy.result(id: params[:id])

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      redirect_to edit_account_path(result.account), error: t(".error")
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
