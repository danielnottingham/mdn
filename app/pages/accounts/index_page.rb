# frozen_string_literal: true

module Accounts
  class IndexPage < ApplicationPage
    attr_reader :accounts

    def initialize(accounts:)
      @accounts = accounts
    end
  end
end
