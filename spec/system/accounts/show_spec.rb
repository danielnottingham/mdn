# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Account show" do
  it "Show account information" do
    user = create(:user)
    account = create(:account, title: "Old title", user: user)

    sign_in(user)
    visit accounts_path

    click_link href: account_path(account)

    expect(page).to have_css("h2", text: account.title)
    expect(page).to have_css("h3", text: I18n.t(".accounts.show_page.account_info"))
    expect(page).to have_link(I18n.t(".accounts.show_page.back_to_list"))
  end
end
