# frozen_string_literal: true

module Accounts
  class ListComponent < ViewComponent::Base
    include ActionPolicy::Behaviour

    attr_accessor :accounts

    def initialize(accounts:)
      @accounts = accounts
    end

    private

    def render?
      accounts.any?
    end

    def edit_button(account)
      mdn_button(builder: :link_to, href: edit_account_path(account), size: :xs, color: :light, title: t(".edit")) do
        mdn_icon(name: :pencil_square, class: "text-gray-400 h-6 w-6")
      end
    end
  end
end
