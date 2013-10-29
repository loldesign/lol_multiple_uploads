class ProjectWithCaption
  include Mongoid::Document
  include Mongoid::LolMultipleImages
  
  multiple_uploads caption: true
end