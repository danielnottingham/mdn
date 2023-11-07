# frozen_string_literal: true

module Categories
  class FormComponent < ViewComponent::Base
    attr_reader :category, :url

    def initialize(category:, url:)
      @category = category
      @url = url
    end

    private

    def submit_button(form)
      return form.mdn_submit t(".new_category_button") if category.new_record?

      form.mdn_submit t(".update_category_button")
    end
  end
end
