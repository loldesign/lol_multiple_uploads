class PhotosController < ActionController::Base
	respond_to :json

	def create
    @resource = params[:model].classify.constantize.find params[:model_id]
    @photo    = @resource.photos.build(remote_image_url: params[:photo])

    respond_with(@photo) do |format|
      if @photo.save
        format.json{ render json: @photo  }
      else
        format.json{ render nothing: true, status: :error }
      end
    end
  rescue Exception
    render nothing: true, status: :error
	end

  def destroy
    @photo = Photo.find params[:id]
    
    respond_with(@photo) do |format|
      if @photo.destroy
        format.json{ render json: @photo }
      else
        format.json{ render nothing: true, status: :error }
      end
    end
  end
end