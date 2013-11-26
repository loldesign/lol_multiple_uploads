class ProjectWithLocalizedCaption
  include Mongoid::Document
  include Mongoid::LolMultipleImages

  multiple_uploads caption_localized: true
end