#encoding: utf-8
class ProfilesController < ApplicationController

  def edit
    @profile = Profile.last || Profile.create
  end 

end