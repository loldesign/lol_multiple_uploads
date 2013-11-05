#Lol Multiple Uploads#
Upload multiples images to your project using __mongoid__, __carrierwave__ and __inkfilepicker__.

You must create one account on [inkfilepicker](https://www.inkfilepicker.com/) and get your __secret key__

## Getting Start ##
---------------------------------------

* Add to Gemfile

`gem 'lol_multiple_uploads', '1.1.0'`

* Run the Generator

`rails g lol_multiple_uploads:install`

* Put your secret key to: __config/lolmultiple_uploads.yml__

`picker_key: 'your_key'`

* require necessary js at: __application.js__

`//= require lol_multiple_uploads/upload`

* in your form or view add:

```
<%= upload_link('Link Text', object, '.images_container')%>

<%= list_photos(object) %> or <%= list_photos(object, :photo_version) %>
#default version is :gallery_thumb
```

* __ps:__ the *.images_container* is a place where the js will append the images uploaded


## Add Captions to Images ##
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

## That's it :) ##