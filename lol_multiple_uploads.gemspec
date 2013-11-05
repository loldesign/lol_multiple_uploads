$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lol_multiple_uploads/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lol_multiple_uploads"
  s.version     = LolMultipleUploads::VERSION
  s.authors     = ["Eduardo Zaghi"]
  s.email       = ["eduardo@loldesign.com.br"]
  s.homepage    = "http://www.loldesign.com.br"
  s.summary     = "Multiple file uploads using mongoid, carrierwave and filepicker"
  s.description = "You must create one account at https://www.inkfilepicker.com/ for use this gem"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile"]

  s.add_dependency "rails"                   , "~> 3.2"
  s.add_dependency "jquery-rails"
  s.add_dependency 'carrierwave-mongoid'     , "~> 0.6.1"
  s.add_dependency 'mongoid'                 , '>= 3.1.2'
  s.add_dependency 'lol_sortable'            , '~> 0.0.1'
  s.add_dependency 'rmagick'                 , '~> 2.13.2'
end