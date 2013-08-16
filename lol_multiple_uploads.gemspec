$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lol_multiple_uploads/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lol_multiple_uploads"
  s.version     = LolMultipleUploads::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of LolMultipleUploads."
  s.description = "TODO: Description of LolMultipleUploads."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"                   , "~> 3.2.13"
  s.add_dependency "jquery-rails"
  s.add_dependency 'carrierwave-mongoid'     , "~> 0.6.1"
  s.add_dependency 'mongoid'                 , '>= 3.1.2'
  s.add_dependency "jquery-fileupload-rails"
end