#encoding: utf-8

require 'spec_helper'

describe UploadHelper do
	context 'when object is persisted' do
		let(:project){ Project.create}

		subject{ helper.upload_link('Upload Imagem', project, '.images', 'gallery_thumb') }
		
		it{ should =~ />Upload Imagem</ }
		it{ should =~ /data-image-container=".images"/ }
		it{ should =~ /data-model="Project"/ }
		it{ should =~ /data-model-id="#{project.id}"/ }
		it{ should =~ /data-file-picker-key="#{PICKER_KEY}"/ }
		it{ should =~ /data-photo-version="gallery_thumb"/ }
	end

	context 'when project is new_record' do
		let(:project){ Project.new}

		subject{ helper.upload_link('Upload Imagem', project, '.images') }

		it { should be_nil}
	end

	context 'when project is nil' do
		subject{ helper.upload_link('Upload Imagem', nil, '.images') }

		it { should be_nil}
	end
end