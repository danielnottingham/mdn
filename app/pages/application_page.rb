# frozen_string_literal: true

class ApplicationPage < ViewComponent::Base
  include Translatable
  include ActionPolicy::Behaviour
end
