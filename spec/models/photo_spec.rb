#encoding: utf-8

require 'spec_helper'

describe Photo do
	
	it { should belong_to(:photable) }
	it { should be_respond_to(:image) }

end