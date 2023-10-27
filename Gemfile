# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "bootsnap", "1.16.0", require: false
gem "cssbundling-rails", "1.3.3"
gem "devise", "4.9.3"
gem "jsbundling-rails", "1.2.1"
gem "lookbook", "2.1.1"
gem "pg", "1.5.4"
gem "propshaft", "0.8.0"
gem "puma", "6.4.0"
gem "rails", "7.1.1"
gem "redis", "5.0.8"
gem "service_actor", "3.7.0"
gem "stimulus-rails", "1.3.0"
gem "turbo-rails", "1.5.0"
gem "tzinfo-data", "2.0.6", platforms: %i[mingw mswin x64_mingw jruby]
gem "view_component", "3.6.0"

group :development, :test do
  gem "debug", "1.8.0", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails", "2.8.1"
  gem "factory_bot_rails", "6.2.0"
end

group :development do
  gem "brakeman", "6.0.1"
  gem "erb_lint", "0.5.0", require: false
  gem "rack-mini-profiler", "3.1.1"
  gem "rubocop", "1.57.1"
  gem "rubocop-performance", "1.19.1"
  gem "rubocop-rails", "2.21.2"
  gem "rubocop-rspec", "2.24.1"
  gem "web-console", "4.2.1"
  # gem "spring"
end

group :test do
  gem "capybara", "3.39.2"
  gem "rspec-rails", "6.0.3"
  gem "shoulda-matchers", "5.3.0"
  gem "simplecov", "0.22.0", require: false
end
