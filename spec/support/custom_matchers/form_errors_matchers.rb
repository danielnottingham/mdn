# frozen_string_literal: true

module CustomMatchers
  def have_form_errors(quantity:)
    Capybara::RSpecMatchers::Matchers::HaveText.new(
      I18n.t("application.error_summary_component.errors_title", count: quantity)
    )
  end
end
