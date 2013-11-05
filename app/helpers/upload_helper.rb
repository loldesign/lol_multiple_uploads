module UploadHelper
	def upload_link(name='Upload File', options={})
		object            = options[:object] || nil
    image_container   = options[:image_container] || '.images-container'
    photo_version     = options[:photo_version] || :gallery_thumb
    
    link_to(name, 'javascript://', class: 'multiple_upload', 'data-model' => object.class, 'data-model-id' => object.id, 'data-store-path' => upload_image_path(format: 'js'), 'data-file-picker-key' => "#{PICKER_KEY}", 'data-image-container' => image_container, 'data-photo-version' => photo_version) unless object.nil? || object.new_record?
	end
end