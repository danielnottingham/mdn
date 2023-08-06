# frozen_string_literal: true

require "rails_helper"

RSpec.describe Accounts::FormComponent, type: :component do
  it "renders the form with the given url" do
    rendered = render_inline(described_class.new(account: Account.new, url: "/submit_url"))

    expect(rendered.to_html).to have_css("form[action='/submit_url']")
  end
end
