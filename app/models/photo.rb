class Photo
	include Mongoid::Document
	include Mongoid::Timestamps

	mount_uploader :image, ImageUploader

	belongs_to :photable, polymorphic: true

	validates :photable, presence: true
end