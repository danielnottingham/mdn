# frozen_string_literal: true

module Accounts
  class FormComponent < ViewComponent::Base
    attr_reader :account, :url

    def initialize(account:, url:)
      @account = account
      @url = url
    end

    private

    def submit_button(form)
      return form.mdn_submit t(".new_account_button") if account.new_record?

      form.mdn_submit t(".edit_account_button")
    end
  end
end
