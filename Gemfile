source "http://rubygems.org"

# Declare your gem's dependencies in lol_multiple_uploads.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem "jquery-rails"
gem 'mongoid'
gem 'carrierwave-mongoid' , "~> 0.6.1"
gem 'lol_sortable'        , "~> 0.0.1"
gem 'rmagick'             , '~> 2.13.2'
gem 'jquery-ui-rails'

group :development, :test do
  gem 'factory_girl_rails', '>= 4.2.0'
  gem 'rspec-rails'       , '>= 2.12.2'
  gem 'pry-rails'         , '>= 0.3.1'
end

group :test do
  gem 'database_cleaner', '>= 1.0.0.RC1'
  gem 'mongoid-rspec'   , '>= 1.7.0'
end