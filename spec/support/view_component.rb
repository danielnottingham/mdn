# frozen_string_literal: true

require "view_component/test_helpers"

RSpec.configure do |config|
  %i[component helper page].each do |type|
    config.include ViewComponent::TestHelpers, type: type
    config.include Rails.application.routes.url_helpers
  end
end
