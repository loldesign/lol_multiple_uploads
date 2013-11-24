module Mongoid
  module LolMultipleImages
    extend ActiveSupport::Concern

    included do
      cattr_accessor :caption_status

      has_many :photos, as: :photable
    end

    module ClassMethods
      def multiple_uploads(option={})
        self.caption_status = option[:caption] || false # config
      end
    end
  end
end