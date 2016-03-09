#Lol Multiple Uploads#
Upload multiples images to your project using __mongoid__, __carrierwave__ and __inkfilepicker__.

You must create one account on [filepicker.io](https://www.filepicker.io.com/) and get your __secret key__

## Getting Start ##
---------------------------------------

* Add to Gemfile

`gem 'lol_multiple_uploads', '2.0.5'`

* Run the Generator

`rails g lol_multiple_uploads:install`

* Put your secret key and ORM at: __config/lolmultiple_uploads.yml__

`picker_key: 'your_key'`

`orm: 'Mongoid #or ActiveRecord'`

* require necessary js at: __application.js__

`//= require lol_multiple_uploads/upload`

* in your form or view add:

```
<%= upload_link('Link Text', object: object, image_container: '.images-container', photo_version: 'gallery_thumb')%>

<%= list_photos(object) %> or <%= list_photos(object, :photo_version) %>
#default version is :gallery_thumb
```

* __ps:__ the *.images_container* is a place where the js will append the images uploaded


##Mongoid##
---------------------------------------

* include __Mongoid::LolMultipleImages__ to your model

```
class Project
  include Mongoid::Document
  include Mongoid::LolMultipleImages
end
```

##ActiveRecord##
---------------------------------------

* include __ActiveRecord::LolMultipleImages__ to yout model

```
class Profile < ActiveRecord::Base
  include ActiveRecord::LolMultipleImages

  multiple_uploads caption: false
end
```

* install __migrantions__

`bundle exec rake railties:install:migrations`

##Single Upload##
---------------------------------------

* set `multiple: false` to `upload_link` helper

`<%= upload_link('Link Text', object: object, image_container: '.images_container', photo_version: 'gallery_thumb', multiple: false)%>`

* and disable sortable from __list_photos__

`<%= list_photos(object, is_sortable: false) %>`

## Add Captions to Images *only Mongoid##
---------------------------------------
* add in your model:

`multiple_uploads caption: true`

* example:
```
  class Project
    include Mongoid::Document
    include Mongoid::LolMultipleImages

    multiple_uploads caption: true
  end
``` 

## Add Captions Localized to Images *only Mongoid##
---------------------------------------
* add in your model:

`multiple_uploads caption_localized: true, available_locales: ['pt-BR', 'en']`

* example:
```
  class Project
    include Mongoid::Document
    include Mongoid::LolMultipleImages

    multiple_uploads caption_localized: true, available_locales: ['pt-BR', 'en']
  end
``` 

* **ps:** the ***available_locales*** is optional, if you not set it will take I18n.available_locales

## That's it :) ##