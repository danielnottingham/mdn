# frozen_string_literal: true

module Accounts
  class FormComponent < ViewComponent::Base
    attr_reader :account, :url

    def initialize(account:, url:)
      @account = account
      @url = url
    end
  end
end
