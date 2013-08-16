#encoding: utf-8
class ProjectsController < ApplicationController

	def edit
		@project = Project.last || Project.create		
	end	

end