# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationPage, type: :page do
  describe "#translate" do
    context "when key starts with ." do
      it "returns translation using class name as scope" do
        I18n.backend.store_translations(
          "pt-BR", {
            my_text: "Oi (Not Scoped Text)",
            my_module: {
              dummy_page: {
                my_text: "Oi (Scoped Text)"
              }
            }
          }
        )

        dummy_page_class = Class.new(described_class) do
          def self.name = "MyModule::DummyPage"

          def call
            content_tag :span, t(".my_text") # key starting with .
          end
        end

        rendered = render_inline(dummy_page_class.new)

        expect(rendered.to_html).to include "Oi (Scoped Text)"
      end
    end

    context "when key doesn't start with ." do
      it "returns translation using root scope" do
        I18n.backend.store_translations(
          "pt-BR", {
            my_text: "Oi (Not Scoped Text)",
            my_module: {
              dummy_page: {
                my_text: "Oi (Scoped Text)"
              }
            }
          }
        )

        dummy_page_class = Class.new(described_class) do
          def self.name = "MyModule::DummyPage"

          def call
            content_tag :span, t("my_text") # key not starting with .
          end
        end

        rendered = render_inline(dummy_page_class.new)

        expect(rendered.to_html).to include "Oi (Not Scoped Text)"
      end
    end

    context "when key ends with `_html`" do
      it "returns a HTML safe string" do
        I18n.backend.store_translations(
          "pt-BR", { my_module: { dummy_page: { my_text_html: "Hi <b>bold text</b>" } } }
        )

        dummy_page_class = Class.new(described_class) do
          def self.name = "MyModule::DummyPage"

          def call
            content_tag :span, t(".my_text_html")
          end
        end

        rendered = render_inline(dummy_page_class.new)

        expect(rendered).to have_css("b", text: "bold text")
      end
    end

    context "when key doesn't end with `_html`" do
      it "returns a not HTML safe string" do
        I18n.backend.store_translations(
          "pt-BR", { my_module: { dummy_page: { my_text: "Hi <b>bold text</b>" } } }
        )

        dummy_page_class = Class.new(described_class) do
          def self.name = "MyModule::DummyPage"

          def call
            content_tag :span, t(".my_text")
          end
        end

        rendered = render_inline(dummy_page_class.new)

        expect(rendered).not_to have_css("b", text: "bold text")
      end
    end
  end

  describe "#t" do
    it "is an alias for #translate" do
      page = described_class.new
      expect(page.method(:t)).to eq page.method(:translate)
    end
  end
end
