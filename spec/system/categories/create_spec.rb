# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Category create" do
  context "with valid form" do
    it "creates a new category" do
      sign_in
      visit categories_path

      click_link href: new_category_path

      expect(page).to have_css("h2", text: I18n.t("categories.new_page.header_title"))

      fill_in I18n.t("activerecord.attributes.category.title"), with: "My category title"
      fill_in I18n.t("activerecord.attributes.category.color"), with: "#ffffff"
      click_button I18n.t(".categories.form_component.new_category_button")

      expect(page).to have_css("h2", text: I18n.t("categories.index_page.header_title"))
      expect(page).to have_text(I18n.t("categories.create.success"))
    end
  end

  context "with invalid form" do
    it "does not create a new category" do
      sign_in
      visit categories_path

      click_link href: new_category_path

      expect(page).to have_css("h2", text: I18n.t("categories.new_page.header_title"))

      fill_in I18n.t("activerecord.attributes.category.title"), with: ""
      fill_in I18n.t("activerecord.attributes.category.color"), with: "#ffffff"
      click_button I18n.t(".categories.form_component.new_category_button")

      expect(page).to have_form_errors(quantity: 1)
      expect(page).to have_css("h2", text: I18n.t("categories.new_page.header_title"))
    end
  end
end
