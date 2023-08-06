# frozen_string_literal: true

module Accounts
  class NewPage < ApplicationPage
    attr_reader :account

    def initialize(account:)
      @account = account
    end
  end
end
