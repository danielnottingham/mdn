# frozen_string_literal: true

require "rails_helper"

RSpec.describe Categories::ListComponent, type: :component do
  it "renders categories with title, balance_cents and color" do
    user = create(:user)
    categories = create_list(:category, 3, user: user)
    rendered = render_inline(described_class.new(categories: categories))

    categories.each do |category|
      expect(rendered.to_html).to have_text(category.title)
        .and have_link(I18n.t("categories.list_component.edit"), href: edit_category_path(category.id))
    end
  end
end
