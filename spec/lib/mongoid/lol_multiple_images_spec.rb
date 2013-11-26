#encoding: utf-8

require 'spec_helper'

describe Mongoid::LolMultipleImages do
	
	context 'when class has the module' do
		subject{ Project }

    it{ should have_many :photos }
	end

  describe 'captions' do
    context 'when is disabled' do
      it{ Project.caption_status.should be_false }
    end

    context 'when is enabled' do
      it{ ProjectWithCaption.caption_status.should be_true }
    end
  end

  describe 'caption_localized' do
    it{ ProjectWithLocalizedCaption.caption_localized_status.should be_true }

    context 'when not set available_locales' do
      it{ ProjectWithLocalizedCaption.available_locales.should eq([:en]) }
    end

    context 'when set available_locales' do
      class ProjectCaptionsLocalizedLocale
        include Mongoid::Document
        include Mongoid::LolMultipleImages

        multiple_uploads caption_localized: true, caption_localized: [:'pt-BR', :en]
      end
      
      it{ ProjectCaptionsLocalizedLocale.available_locales.should eq([:en]) }
    end
  end
end
