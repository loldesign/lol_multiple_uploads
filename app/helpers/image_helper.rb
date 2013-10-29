module ImageHelper 

  def list_photos(resource)
    content_tag(:div, class: 'lol-multiple-uploads images-container is-sortable', 'data-resource' => 'photo', 'data-has-caption' => resource.class.caption_status) do
      render partial: '/layouts/lol_multiple_uploads/photo', collection: resource.photos.prioritized
    end
  end

end