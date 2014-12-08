module ImageHelper 

  def list_photos(resource, options={})
    photo_version   = options[:photo_version] || :gallery_thumb
    is_sortable     = options.has_key?(:is_sortable) ? options[:is_sortable] : true
    sortable_class  = is_sortable ? 'is-sortable' : ''

    content_tag(:div, class: "lol-multiple-uploads images-container #{sortable_class}", 'data-resource' => 'photo', 'data-has-caption' => resource.class.caption_status, 'data-has-caption-localized' => resource.class.caption_localized_status) do
      render partial: '/layouts/lol_multiple_uploads/photo', collection: resource.photos.prioritized, locals: {photo_version: photo_version}
    end
  end

end