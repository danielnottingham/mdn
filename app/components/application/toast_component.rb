# frozen_string_literal: true

module Application
  class ToastComponent < ViewComponent::Base
    attr_reader :flash

    ADAPTED_MESSAGE_TYPES = {
      notice: :success,
      alert: :error
    }.freeze

    def initialize(flash:)
      @flash = flash
    end

    private

    def render?
      flash.any?
    end

    def flash_message
      type, message = flash.first
      type = ADAPTED_MESSAGE_TYPES[type.to_sym] if ADAPTED_MESSAGE_TYPES.key?(type.to_sym)

      mdn_toast(type: type.to_sym) { message }
    end
  end
end
