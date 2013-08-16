begin
	LOL_MULTIPLE_UPLOADS_CONFIG = YAML.load_file("#{Rails.root}/config/lol_multiple_uploads.yml")
	PICKER_KEY 									= LOL_MULTIPLE_UPLOADS_CONFIG['picker_key']
rescue Exception => e
	puts '-----------------------------------------------------'
	puts '[WARNING] LolMultipleUploads is not configured :('
	puts '[WARNING] run -> rails g lol_multiple_uploads:install'
	puts '-----------------------------------------------------'
end

		
		