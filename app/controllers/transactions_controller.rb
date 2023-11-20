# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    result = Transactions::List.result(scope: transactions_scope)

    render Transactions::IndexPage.new(transactions: result.transactions, current_user: current_user)
  end

  def new
    transaction = Transaction.new(transaction_type: TransactionTypes::EXPENSE, transaction_date: Time.zone.today)

    render Transactions::NewPage.new(
      transaction: transaction,
      accounts: current_accounts,
      categories: current_categories,
      current_user: current_user
    )
  end

  def edit
    authorize! transaction

    render Transactions::EditPage.new(
      transaction: transaction,
      accounts: current_accounts,
      categories: current_categories,
      current_user: current_user
    )
  end

  def create
    authorize_related_data!

    result = Transactions::Create.result(attributes: transaction_params)

    if result.success?
      redirect_to transactions_path, success: t(".success")
    else
      new_page = Transactions::NewPage.new(
        transaction: result.transaction,
        accounts: current_accounts,
        categories: current_categories,
        current_user: current_user
      )

      render new_page, status: :unprocessable_entity
    end
  end

  def update
    authorize! transaction
    authorize_related_data!

    result = Transactions::Update.result(id: transaction.id, attributes: transaction_params)

    if result.success?
      redirect_to transactions_path, success: t(".success")
    else
      edit_page = Transactions::EditPage.new(
        transaction: result.transaction,
        accounts: current_accounts,
        categories: current_categories,
        current_user: current_user
      )

      render edit_page, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! transaction

    result = Transactions::Destroy.result(id: transaction.id)

    if result.success?
      redirect_to transactions_path, success: t(".success")
    else
      redirect_to edit_transaction_path(result.transaction), error: t(".error")
    end
  end

  private

  def transactions_scope
    authorized_scope(Transaction.all)
  end

  def authorize_related_data!
    authorize_account if transaction_params[:account_id].present?
    authorize_category if transaction_params[:category_id].present?
  end

  def authorize_account
    account = Accounts::Find.result(id: transaction_params[:account_id]).account
    authorize!(account, to: :show?)
  end

  def authorize_category
    category = Categories::Find.result(id: transaction_params[:category_id]).category
    authorize!(category, to: :show?)
  end

  def transaction
    @transaction ||= Transactions::Find.result(id: params[:id]).transaction
  end

  def transaction_params
    params.require(:transaction).permit(
      :title,
      :amount_cents,
      :transaction_date,
      :transaction_type,
      :payee,
      :description,
      :account_id,
      :category_id
    ).to_h
  end
end
