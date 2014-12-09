module ActiveRecord
  module LolMultipleImages
    extend ActiveSupport::Concern

    included do
      cattr_accessor :caption_status, :caption_localized_status, :available_locales

      has_many :photos, as: :photable
    end

    def photo_cover(version=nil)
      photo = self.photos.prioritized.first || photos.build

      photo.image.url(version)
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