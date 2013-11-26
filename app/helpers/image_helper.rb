module ImageHelper 

  def list_photos(resource, photo_version=:gallery_thumb)
    content_tag(:div, class: 'lol-multiple-uploads images-container is-sortable', 'data-resource' => 'photo', 'data-has-caption' => resource.class.caption_status, 'data-has-caption-localized' => resource.class.caption_localized_status) do
      render partial: '/layouts/lol_multiple_uploads/photo', collection: resource.photos.prioritized, locals: {photo_version: photo_version}
    end
  end

end