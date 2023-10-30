# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_many(:accounts).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_length_of(:full_name).is_at_most(60) }
  end
end
