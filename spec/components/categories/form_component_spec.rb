# frozen_string_literal: true

require "rails_helper"

RSpec.describe Categories::FormComponent, type: :component do
  it "renders the form with the given url" do
    rendered = render_inline(described_class.new(category: Category.new, url: "/submit_url"))

    expect(rendered.to_html).to have_css("form[action='/submit_url']")
  end

  context "when the form is for a new record" do
    it "renders the button text with new_category_button translation" do
      rendered = render_inline(described_class.new(category: Category.new, url: "/submit_url"))

      expect(rendered.to_html).to have_button(I18n.t(".categories.form_component.new_category_button"))
    end
  end

  context "when the form is for an existing record" do
    it "renders the button text with update_category_button translation" do
      category = create(:category)

      rendered = render_inline(described_class.new(category: category, url: "/submit_url"))

      expect(rendered.to_html).to have_button(I18n.t(".categories.form_component.update_category_button"))
    end
  end
end
