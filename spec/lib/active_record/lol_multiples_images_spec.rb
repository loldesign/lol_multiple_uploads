#encoding: utf-8

require 'spec_helper'

describe ActiveRecord::LolMultipleImages do
  before{ Profile.destroy_all }

  describe '#photo_cover', orm: :active_record do
    let(:profile){ Profile.create }

    context 'when has images' do
      let!(:photo){ profile.photos.create(remote_image_url: 'http://www.saopaulofc.net/media/1209825/muricy_wallpapers_1980x1440_02.jpg') }

      it{ profile.photo_cover.should =~ /\/uploads\/photo\/image\/\d{1,}\/\w{1,}(.jpg|.png|.gif)/ }
    end

    context 'when hasnt images' do
      it{ profile.photo_cover.should =~ /\/no-image(.jpg|.gif|.png)/ }
    end
  end
end
