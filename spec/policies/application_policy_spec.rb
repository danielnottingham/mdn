# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationPolicy do
  # rubocop:disable RSpec/ExpectActual
  it "aliases edit? to update?" do
    policy = described_class.new(user: User.new)

    expect(:edit?).to be_an_alias_of(policy, :update?)
  end
  # rubocop:enable RSpec/ExpectActual
end
