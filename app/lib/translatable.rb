# frozen_string_literal: true

module Translatable
  def self.included(page_class)
    page_class.extend(ClassMethods)
  end

  module ClassMethods
    def translation_path
      @translation_path ||= name&.split("::")&.join(".")&.underscore.to_s
    end
  end

  def translate(key, **options)
    key = "#{self.class.translation_path}#{key}" if key.start_with?(".")

    ActiveSupport::HtmlSafeTranslation.translate(key, **options)
  end
  alias t translate
end
