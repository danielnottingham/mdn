# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Categories" do
  describe "GET #index" do
    context "when user is logged in" do
      it "returns a successful response" do
        sign_in
        get categories_path

        expect(response).to have_http_status :ok
      end
    end

    context "when user is not logged in" do
      it "returns a redirect response" do
        get categories_path

        expect(response).to have_http_status :redirect
      end
    end
  end

  describe "GET #new" do
    context "when user is logged in" do
      it "returns a successful response" do
        sign_in
        get new_category_path

        expect(response).to have_http_status :ok
      end
    end

    context "when user is not logged in" do
      it "returns a redirect response" do
        get new_category_path

        expect(response).to have_http_status :redirect
      end
    end
  end

  describe "GET #edit" do
    context "when user is logged in" do
      it "returns a successful response" do
        user = create(:user)
        sign_in(user)
        category = create(:category, user: user)
        get edit_category_path(category)

        expect(response).to have_http_status :ok
      end
    end

    context "when user is not logged in" do
      it "returns a redirect response" do
        category = create(:category)
        get edit_category_path(category)

        expect(response).to have_http_status :redirect
      end
    end
  end
end
