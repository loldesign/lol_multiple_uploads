Rails.application.routes.draw do

	post   '/upload-image'     => 'photos#create' , as: :upload_image
  delete '/remove-image/:id' => 'photos#destroy', as: :remove_image
end
