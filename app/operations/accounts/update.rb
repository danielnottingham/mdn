# frozen_string_literal: true

module Accounts
  class Update < Actor
    input :id, type: String
    input :attributes, type: Hash

    output :account, type: Account

    def call
      self.account = find_account

      fail!(error: :invalid_record) unless account.update(attributes)
    end

    private

    def find_account
      Accounts::Find.result(id: id).account
    end
  end
end
