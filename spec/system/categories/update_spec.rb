# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Category update" do
  context "with valid form" do
    it "updates an category" do
      user = create(:user)
      category = create(:category, title: "Old title", user: user)

      sign_in(user)
      visit categories_path

      click_link href: edit_category_path(category)

      expect(page).to have_css("h2", text: category.title)

      fill_in I18n.t("activerecord.attributes.category.title"), with: "New title"
      click_button I18n.t(".categories.form_component.update_category_button")

      expect(page).to have_text(I18n.t("categories.update.success"))
      expect(page).to have_css("div", text: "New title")
    end
  end

  context "with invalid form" do
    it "does not update an category" do
      user = create(:user)
      category = create(:category, title: "Old title", user: user)

      sign_in(user)
      visit categories_path

      click_link href: edit_category_path(category)

      expect(page).to have_css("h2", text: category.title)

      fill_in I18n.t("activerecord.attributes.category.title"), with: ""
      click_button I18n.t(".categories.form_component.update_category_button")

      expect(page).to have_form_errors(quantity: 1)
    end
  end
end
