#endoding: utf-8
module LolMultipleUploads
  class InstallGenerator < Rails::Generators::Base
  	source_root File.expand_path('../templates', __FILE__)

  	def copy_yml
  		copy_file "lol_multiple_uploads.yml", "config/lol_multiple_uploads.yml"
  	end

  	def add_routes
  		route "mount LolMultipleUploads::Engine => '/'"
  	end
  end
end

# TODO
# run rake railties:install:migrations