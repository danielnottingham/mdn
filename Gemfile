# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "bootsnap", "1.16.0", require: false
gem "cssbundling-rails", "1.1.2"
gem "jsbundling-rails", "1.1.1"
gem "pg", "1.1"
gem "puma", "5.0"
gem "rails", "7.0.4.3"
gem "redis", "4.0"
gem "sprockets-rails", "3.4.2"
gem "stimulus-rails", "1.2.1"
gem "turbo-rails", "1.4.0"
gem "tzinfo-data", "2.0.6", platforms: %i[mingw mswin x64_mingw jruby]

# gem "kredis"
# gem "bcrypt", "~> 3.1.7"
# gem "sassc-rails"
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", "1.8.0", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "brakeman", "5.4.1"
  gem "erb_lint", "0.4.0", require: false
  gem "rack-mini-profiler", "3.1.0"
  gem "rubocop", "1.51.0"
  gem "rubocop-performance", "1.18.0"
  gem "rubocop-rails", "2.19.1"
  gem "rubocop-rspec", "2.22.0"
  gem "web-console", "4.2.0"
  # gem "spring"
end
