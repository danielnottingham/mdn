# frozen_string_literal: true

require "rails_helper"

RSpec.describe Categories::List, type: :operation do
  describe ".result" do
    it "returns categories ordered by creation date DESC" do
      user = create(:user)
      education = create(:category, created_at: Time.zone.yesterday, user: user)
      home = create(:category, created_at: Time.zone.tomorrow, user: user)
      leisure = create(:category, created_at: Time.zone.today, user: user)

      result = described_class.result

      expect(result.categories.to_a).to eq [home, leisure, education]
    end

    it "accepts scope" do
      user = create(:user)
      first_categories = create_list(:category, 3, created_at: Time.zone.yesterday, user: user)
      create_list(:category, 3, created_at: Time.zone.tomorrow, user: user)

      result = described_class.result(scope: Category.where(created_at: ..Time.zone.today))

      expect(result.categories.to_a).to match_array(first_categories)
    end
  end
end
