class Project
	include Mongoid::Document
  include Mongoid::LolMultipleImages

  # multiple_uploads caption_localized: true, available_locales: ['pt-BR', 'en']
  # multiple_uploads caption: true
end