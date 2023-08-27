# frozen_string_literal: true

module Accounts
  class EditPage < ApplicationPage
    attr_reader :account

    def initialize(account:)
      @account = account
    end
  end
end
