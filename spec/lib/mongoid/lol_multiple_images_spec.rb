#encoding: utf-8

require 'spec_helper'

describe Mongoid::LolMultipleImages do
	
	context 'when clas has the module' do
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
end
