# frozen_string_literal: true

module Application
  class ErrorSummaryComponent < ViewComponent::Base
    attr_reader :record

    def initialize(record:)
      @record = record
    end

    private

    def render?
      record.errors.present?
    end

    def error_title
      I18n.t("application.error_summary_component.errors_title", count: record.errors.count)
    end
  end
end
