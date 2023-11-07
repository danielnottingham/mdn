# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Category destroy" do
  context "when category can be destroyed" do
    it "destroys category" do
      user = create(:user)
      category = create(:category, user: user, title: "My category")

      sign_in(user)
      visit categories_path
      click_link href: edit_category_path(category)

      expect(page).to have_css("h2", text: category.title)

      click_button(I18n.t("categories.edit_page.destroy"))
      page.accept_alert(text: I18n.t("categories.edit_page.destroy_confirm"))

      expect(page).to have_css("h2", text: I18n.t("categories.index_page.header_title"))
      expect(page).to have_text(I18n.t("categories.destroy.success"))
    end
  end

  context "when category cannot be destroyed" do
    it "shows error message" do
      user = create(:user)
      category = create(:category, user: user, title: "My category")

      sign_in(user)
      visit categories_path
      click_link href: edit_category_path(category)

      allow(Categories::Destroy).to receive(:result)
        .and_return(ServiceActor::Result.new(failure?: true, category: category))

      click_button(I18n.t("categories.edit_page.destroy"))
      page.accept_alert(text: I18n.t("categories.edit_page.destroy_confirm"))

      expect(page).to have_css("h2", text: category.title)
      expect(page).to have_text(I18n.t("categories.destroy.error"))
    end
  end
end
