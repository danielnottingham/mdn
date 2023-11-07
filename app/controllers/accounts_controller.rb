# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    result = Accounts::List.result(scope: authorized_accounts_scope)

    render Accounts::IndexPage.new(accounts: result.accounts, current_user: current_user)
  end

  def new
    render Accounts::NewPage.new(account: Account.new, current_user: current_user)
  end

  def edit
    authorize! account

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
    authorize! account
    result = Accounts::Update.result(id: account.id, attributes: account_params)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      render Accounts::EditPage.new(account: result.account, current_user: current_user), status: :unprocessable_entity
    end
  end

  def destroy
    authorize! account
    result = Accounts::Destroy.result(id: account.id)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      redirect_to edit_account_path(result.account), error: t(".error")
    end
  end

  private

  def authorized_accounts_scope
    scope = authorized_scope(Account.all, with: AccountPolicy)
    Accounts::List.result(scope: scope).accounts
  end

  def account
    @account ||= Accounts::Find.result(id: params[:id]).account
  end

  def account_params
    params.require(:account).permit(:title, :balance_cents, :color).to_h.merge(user_id: current_user.id)
  end
end
