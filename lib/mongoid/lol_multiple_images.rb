module Mongoid
  module LolMultipleImages
    extend ActiveSupport::Concern

    included do
      cattr_accessor :caption_status, :caption_localized_status, :available_locales

      has_many :photos, as: :photable
    end

    module ClassMethods
      def multiple_uploads(option={})
        self.caption_status           = option[:caption] || false # config
        self.caption_localized_status = option[:caption_localized] || false
        self.available_locales        = option[:available_locales] || I18n.available_locales
      end
    end
  end
end