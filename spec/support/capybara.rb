# frozen_string_literal: true

require "capybara/rails"
require "capybara/rspec"

RSpec.configure do |config|
  %i[component page].each do |type|
    config.include Capybara::RSpecMatchers, type: type
  end

  config.before(:each, type: :system) do
    driven_by(:selenium, using: :headless_chrome, screen_size: [1920, 1080])
  end
end
