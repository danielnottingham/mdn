# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Transactions" do
  describe "GET #index" do
    it "requires authentication" do
      build_stubbed(:transaction)
      get transactions_path

      expect(response).to be_authenticated
    end

    it "returns a successful response" do
      sign_in
      get transactions_path

      expect(response).to have_http_status :ok
    end
  end
end
