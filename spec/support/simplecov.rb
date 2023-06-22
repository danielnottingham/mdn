# frozen_string_literal: true

require "simplecov"

SimpleCov.start do
  add_group "Components", "app/components"
  add_group "Controllers", "app/controllers"
  add_group "Enumerations", "app/enumerations"
  add_group "Jobs", "app/jobs"
  add_group "Lib", "app/lib"
  add_group "Models", "app/models"
  add_group "Mailers", "app/mailers"
  add_group "Operations", "app/operations"
  add_group "Pages", "app/pages"
  add_group "Policies", "app/policies"

  add_filter "config"
  add_filter "spec"
  add_filter "app/channels"
end
