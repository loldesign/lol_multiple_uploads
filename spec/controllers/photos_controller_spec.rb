#encoding: utf-8

require 'spec_helper'

describe PhotosController do
	describe '#create' do
		let(:project){ Project.create }

		context 'when success' do
			before{ post :create, model: 'project', model_id: project.id, photo: 'http://s2.glbimg.com/UmEUNV56FeEs4w9qF7LmIyNM1iY=/155xorig/smart/s2.glbimg.com/0VuGZAaOLKQxIwA_b4DPZS4bv_I=/317x12:1363x923/155x135/s.glbimg.com/es/ge/f/original/2013/08/15/vitinho_vitorsilvasspress_15.jpg', format: 'json'}	
			
			it{ project.reload.photos.should_not be_empty }
			it{ response.body.should eq(project.reload.photos.first.to_json)}
			it{ assigns[:photo].photable_id.should eq(project.id) }
			it{ assigns[:photo].photable_type.should eq(project.class.to_s) }
		end

		context 'when error on file' do
			before{ post :create, model: 'project', model_id: project.id, photo: '', format: 'json'}	

			it {response.status.should eq(500)}
		end

		context 'when error on photable' do
			before{ post :create, model: '', model_id: '', photo: 'http://s2.glbimg.com/UmEUNV56FeEs4w9qF7LmIyNM1iY=/155xorig/smart/s2.glbimg.com/0VuGZAaOLKQxIwA_b4DPZS4bv_I=/317x12:1363x923/155x135/s.glbimg.com/es/ge/f/original/2013/08/15/vitinho_vitorsilvasspress_15.jpg', format: 'json'}	

			it {response.status.should eq(500)}
		end
	end
end

class Project
	include Mongoid::Document
	include Mongoid::LolMultipleImages
end