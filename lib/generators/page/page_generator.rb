# frozen_string_literal: true

class PageGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def generate
    template "page.erb", File.join("app/pages", class_path, "#{file_name}_page.rb")
    template "template.html.erb", File.join("app/pages", class_path, "#{file_name}_page.html.erb")
  end
end
