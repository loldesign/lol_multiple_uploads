#Lol Multiple Uploads#
Upload multiples images to your project using __mongoid__, __carrierwave__ and __inkfilepicker__.

You must create one account on [inkfilepicker](https://www.inkfilepicker.com/) and get your __secret key__

## Getting Start ##
---------------------------------------

* Add to Gemfile

`gem 'lol_multiple_uploads', git: 'git@github.com:loldesign/lol_multiple_uploads.git'`

* Run the Generator

`rails g lol_multiple_uploads:install`

* Put your secret key to: __config/lolmultiple_uploads.yml__

`picker_key: 'your_key'`

* require necessary js at: __application.js__

`//= require lol_multiple_uploads/upload`

* in your form or view add:

```
<%= upload_link('Link Text', object, '.images-container')%>

<div class 'images-container'></div>
```

* __ps:__ the *.images_container* is a place where the js will append the images uploaded


* enjoy it :)

