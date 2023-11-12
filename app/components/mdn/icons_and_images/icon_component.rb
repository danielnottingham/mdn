# frozen_string_literal: true

module Mdn
  module IconsAndImages
    class IconComponent < ViewComponent::Base
      attr_reader :name, :color, :html_options

      SOLID_COLORS_CLASSES = {
        indigo: "fill-indigo-500",
        emerald: "fill-emerald-500",
        slate: "fill-slate-500",
        red: "fill-red-500",
        current_color: "fill-current"
      }.freeze

      ICON_TYPE = {
        arrow_left: :solid,
        building_library: :solid,
        calendar: :solid,
        check: :solid,
        cog_6_tooth: :solid,
        currency_dollar: :solid,
        eye: :solid,
        facebook: :solid,
        home: :solid,
        information_circle: :solid,
        bolt: :solid,
        pencil_square: :solid,
        plus: :solid,
        tag: :solid,
        trash: :solid,
        twitter: :solid,
        user: :solid,
        wallet: :solid,
        whatsapp: :solid,
        x: :solid
      }.freeze

      def initialize(name:, color: :current_color, **html_options)
        @name = name
        @color = color.to_sym
        @html_options = html_options
      end

      private

      def render?
        name.present? && ICON_TYPE.key?(name.to_sym)
      end

      def icon_classes
        html_options[:class] || "w-6 h-6"
      end

      def color_classes
        SOLID_COLORS_CLASSES[color]
      end

      def options
        html_options.merge(class: [icon_classes, color_classes])
      end
    end
  end
end
