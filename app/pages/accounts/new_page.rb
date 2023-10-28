# frozen_string_literal: true

module Accounts
  class NewPage < ApplicationPage
    attr_reader :account, :current_user

    def initialize(account:, current_user:)
      @account = account
      @current_user = current_user
    end
  end
end
