# frozen_string_literal: true

module Accounts
  class IndexPage < ApplicationPage
    attr_reader :accounts, :current_user

    def initialize(accounts:, current_user:)
      @accounts = accounts
      @current_user = current_user
    end
  end
end
