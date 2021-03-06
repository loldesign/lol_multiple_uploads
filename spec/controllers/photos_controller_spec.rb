#encoding: utf-8

require 'spec_helper'

describe PhotosController do
	describe '#create' do
		let(:project){ Project.create }

		context 'when success' do
			before{ post :create, model: 'project', model_id: project.id, photo: 'http://s2.glbimg.com/UmEUNV56FeEs4w9qF7LmIyNM1iY=/155xorig/smart/s2.glbimg.com/0VuGZAaOLKQxIwA_b4DPZS4bv_I=/317x12:1363x923/155x135/s.glbimg.com/es/ge/f/original/2013/08/15/vitinho_vitorsilvasspress_15.jpg', format: 'json'}	
			
			it{ project.reload.photos.should_not be_empty }
			it{ project.reload.photos.first.image.url.should =~ /vitinho_vitorsilvasspress_15.jpg/ }
			it{ response.body.should eq(project.reload.photos.first.to_json)}
			it{ assigns[:photo].photable_id.should eq(project.id) }
			it{ assigns[:photo].photable_type.should eq(project.class.to_s) }
		end

		context 'when has not file' do
			before{ post :create, model: 'project', model_id: project.id, photo: '', format: 'json'}	

			it { project.reload.photos.first.image.url.should =~ /no-image.jpg/ }
		end

		context 'when error on photable' do
			before{ post :create, model: '', model_id: '', photo: 'http://s2.glbimg.com/UmEUNV56FeEs4w9qF7LmIyNM1iY=/155xorig/smart/s2.glbimg.com/0VuGZAaOLKQxIwA_b4DPZS4bv_I=/317x12:1363x923/155x135/s.glbimg.com/es/ge/f/original/2013/08/15/vitinho_vitorsilvasspress_15.jpg', format: 'json'}	

			it {response.status.should eq(500)}
		end
	end

	describe "#update" do

		context 'when success' do
			let!(:project) { Project.create }
			let!(:photo) { project.photos.create(remote_image_url: 'http://s2.glbimg.com/UmEUNV56FeEs4w9qF7LmIyNM1iY=/155xorig/smart/s2.glbimg.com/0VuGZAaOLKQxIwA_b4DPZS4bv_I=/317x12:1363x923/155x135/s.glbimg.com/es/ge/f/original/2013/08/15/vitinho_vitorsilvasspress_15.jpg')} 
			
			before{ put :update, id: photo.to_param, photo: {caption: 'image caption'}, format: 'json' }

			subject{ photo.reload }

			it{ subject.caption.should =~ /image caption/ }
		end

		context 'when fail' do
			let!(:project) { ProjectWithCaption.create }
			let!(:photo) { project.photos.create(remote_image_url: 'http://s2.glbimg.com/UmEUNV56FeEs4w9qF7LmIyNM1iY=/155xorig/smart/s2.glbimg.com/0VuGZAaOLKQxIwA_b4DPZS4bv_I=/317x12:1363x923/155x135/s.glbimg.com/es/ge/f/original/2013/08/15/vitinho_vitorsilvasspress_15.jpg')} 

			before{ put :update, id: photo.to_param, photo: {caption: ''}, format: 'json'	}
			
			it {response.status.should eq(500)}
		end
	end

	describe '#delete' do
		let(:project){ Project.create(photos: [Photo.create(remote_image_url: 'http://s2.glbimg.com/5yP_9SWLo8VmSnoieH6tXTvGrBE=/300x397/s.glbimg.com/es/ge/f/original/2013/09/06/thiago_silva.jpg')]) }

		before{ delete :destroy, id: project.photos.first.id, format: 'json' }

		it {response.status.should eq(200)}
		it {Photo.where(id: project.photos.first.id).should be_empty}
	end
end