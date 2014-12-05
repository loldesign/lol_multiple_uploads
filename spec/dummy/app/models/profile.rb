class Profile < ActiveRecord::Base
  include ActiveRecord::LolMultipleImages

  multiple_uploads caption: false
end
