#encoding: utf-8

require 'spec_helper'

describe Photo do
	
	it { should belong_to(:photable) }
  it { should be_respond_to(:image) }
	it { should have_fields(:caption) }
  
  describe "caption validation" do
    context "when caption is enable" do
      let!(:project) { ProjectWithCaption.create } 
      let!(:photo)   { project.photos.create(remote_image_url: 'http://s2.glbimg.com/UmEUNV56FeEs4w9qF7LmIyNM1iY=/155xorig/smart/s2.glbimg.com/0VuGZAaOLKQxIwA_b4DPZS4bv_I=/317x12:1363x923/155x135/s.glbimg.com/es/ge/f/original/2013/08/15/vitinho_vitorsilvasspress_15.jpg') }

      context 'when is valid' do
        before do
          photo.reload
          photo.caption = 'its is image caption'
        end

        it{ photo.should be_valid }
      end

      context 'when is invalid' do
        it{ photo.reload.should_not be_valid }
      end
    end

    context "when caption is disable" do
      let(:project) { Project.create } 
      let!(:photo)   { project.photos.create(remote_image_url: 'http://s2.glbimg.com/UmEUNV56FeEs4w9qF7LmIyNM1iY=/155xorig/smart/s2.glbimg.com/0VuGZAaOLKQxIwA_b4DPZS4bv_I=/317x12:1363x923/155x135/s.glbimg.com/es/ge/f/original/2013/08/15/vitinho_vitorsilvasspress_15.jpg') }

      before do
        photo.reload
        photo.caption = ''
      end

      it{ photo.should be_valid }
    end
  end

end