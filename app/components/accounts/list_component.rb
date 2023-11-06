# frozen_string_literal: true

module Accounts
  class ListComponent < ViewComponent::Base
    attr_accessor :accounts

    def initialize(accounts:)
      @accounts = accounts
    end

    private

    def render?
      accounts.any?
    end
  end
end
