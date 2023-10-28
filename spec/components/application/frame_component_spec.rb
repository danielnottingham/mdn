# frozen_string_literal: true

require "rails_helper"

RSpec.describe Application::FrameComponent, type: :component do
  it "renders the frame with navbar and sidebar" do
    user = build_stubbed(:user)
    controller = "app/controllers/accounts_controller.rb"
    rendered = render_inline(described_class.new(current_user: user, current_controller: controller))
    navbar = render_inline(Mdn::Structure::NavbarComponent.new(title: "MDN")) do |nav|
      nav.with_item(builder: :button_to, href: destroy_user_session_path, method: :delete, data: { turbo: false }) do
        "Sair"
      end
    end
    sidebar = render_inline(Mdn::Structure::SidebarComponent.new) do |side|
      side.with_item(href: accounts_path, icon: :wallet) { "Contas" }
    end

    expect(rendered.to_html).to include(navbar.to_html, sidebar.to_html)
  end
end
