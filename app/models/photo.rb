class Photo
	include Mongoid::Document
	include Mongoid::Timestamps
  include Mongoid::LolSortable

	mount_uploader :image, ImageUploader

	belongs_to :photable, polymorphic: true

	validates :photable, presence: true

  field :caption

  validates :caption, presence: true, if: :has_caption?, on: :update

  def has_caption?
    self.photable.present? && self.photable.caption_status
  end
end