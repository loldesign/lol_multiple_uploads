Rails.application.routes.draw do

	post '/upload-image' => 'photos#create', as: :upload_image

end
