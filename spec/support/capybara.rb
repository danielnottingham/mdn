# frozen_string_literal: true

require "capybara/rails"
require "capybara/rspec"

RSpec.configure do |config|
  %i[component page].each do |type|
    config.include Capybara::RSpecMatchers, type: type
  end

  config.before(:each, type: :system) do
    driven_by(:rack_test)
    # driven_by(:selenium, using: :headless_chrome, screen_size: [1920, 1080])
    # driven_by(:selenium, using: :headless_firefox, screen_size: [1920, 1080])
  end

  config.around(:each, :with_forgery_protection) do |example|
    orig = ActionController::Base.allow_forgery_protection

    begin
      ActionController::Base.allow_forgery_protection = true
      example.run
    ensure
      ActionController::Base.allow_forgery_protection = orig
    end
  end
end
