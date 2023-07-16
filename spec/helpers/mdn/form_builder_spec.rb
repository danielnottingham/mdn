# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mdn::FormBuilder do
  before do
    ActiveRecord::Base.connection.create_table :posts, force: true do |t|
      t.boolean(:active)
      t.string(:bg_color)
      t.string(:name)
      t.string(:status)
    end

    post_class = Class.new(ApplicationRecord)
    stub_const("Post", post_class)
  end

  after do
    ActiveRecord::Base.connection.drop_table(:articles, if_exists: true)
  end

  describe "#mdn_checkbox" do
    it "render" do
      post = Post.new
      builder = described_class.new(:post, post, self, {})

      expect(builder.mdn_checkbox(:active, "Content")).to be_present
    end
  end

  describe "#mdn_color_field" do
    it "render" do
      post = Post.new
      builder = described_class.new(:post, post, self, {})

      expect(builder.mdn_color_field(:bg_color)).to be_present
    end
  end

  describe "#mdn_file_field" do
    it "render" do
      post = Post.new
      builder = described_class.new(:post, post, self, {})

      expect(builder.mdn_file_field(:name)).to be_present
    end
  end

  describe "#mdn_label" do
    it "render" do
      post = Post.new
      builder = described_class.new(:post, post, self, {})

      expect(builder.mdn_label(:name, "Label")).to be_present
    end
  end

  describe "#mdn_select" do
    it "render" do
      post = Post.new
      builder = described_class.new(:post, post, self, {})

      expect(builder.mdn_select(:name)).to be_present
    end
  end

  describe "#mdn_submit" do
    it "render" do
      post = Post.new
      builder = described_class.new(:post, post, self, {})

      expect(builder.mdn_submit("Content")).to be_present
    end

    it "render without content" do
      post = Post.new
      builder = described_class.new(:post, post, self, {})

      expect(builder.mdn_submit).to be_present
    end
  end

  describe "#mdn_text_area" do
    it "render" do
      post = Post.new
      builder = described_class.new(:post, post, self, {})

      expect(builder.mdn_text_area(:name)).to be_present
    end
  end

  describe "#mdn_text_field" do
    it "render" do
      post = Post.new
      builder = described_class.new(:post, post, self, {})

      expect(builder.mdn_text_field(:name)).to be_present
    end
  end
end
