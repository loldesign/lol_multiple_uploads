module Mongoid
	module LolMultipleImages
		extend ActiveSupport::Concern

		included do
      has_many :photos, as: :photable
    end
    
		module ClassMethods
		end
	end
end