# frozen_string_literal: true

RSpec.configure do |config|
  config.include CustomMatchers
end

RSpec::Matchers.define_negated_matcher :not_change, :change
