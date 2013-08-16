#encoding: utf-8

require 'spec_helper'

describe Mongoid::LolMultipleImages do
	
	context 'when clas has the module' do
		subject{ Project }

		it{ should have_many :photos }
	end

end

class Project
	include Mongoid::Document
	include Mongoid::LolMultipleImages
end
