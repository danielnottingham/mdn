# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Categories" do
  describe "GET #index" do
    it "requires authentication" do
      build_stubbed(:category)
      get categories_path

      expect(response).to be_authenticated
    end

    it "returns a successful response" do
      sign_in
      get categories_path

      expect(response).to have_http_status :ok
    end
  end

  describe "GET #new" do
    it "requires authentication" do
      get new_category_path

      expect(response).to be_authenticated
    end

    it "returns a successful response" do
      sign_in
      get new_category_path

      expect(response).to have_http_status :ok
    end
  end

  describe "GET #edit" do
    it "requires authentication" do
      category = create(:category)
      get edit_category_path(category)

      expect(response).to be_authenticated
    end

    it "authorizes category" do
      sign_in
      category = create(:category)

      expect { get edit_category_path(category) }.to be_authorized_to(:update?, category)
    end
  end

  describe "POST #create" do
    it "requires authentication" do
      post categories_path

      expect(response).to be_authenticated
    end
  end

  describe "PUT #update" do
    it "authorizes category" do
      sign_in
      category = create(:category)

      expect { put category_path(category.id) }.to be_authorized_to(:update?, category)
    end

    it "requires authentication" do
      category = create(:category)
      put category_path(category)

      expect(response).to be_authenticated
    end
  end

  describe "DELETE #destroy" do
    it "authorizes category" do
      sign_in
      category = create(:category)

      expect { delete category_path(category) }.to be_authorized_to(:destroy?, category)
    end

    it "requires authentication" do
      category = create(:category)
      delete category_path(category)

      expect(response).to be_authenticated
    end
  end
end
