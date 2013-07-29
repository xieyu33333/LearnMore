class HomesController < ApplicationController
  def index
  	@file_classify = [0,1,2,3]
  	@blog_classify = [0,1,2,3]
  	@blog = Blog.all
  	@file = Studyfile.all	
    @body_id = "home"
  end

  def all_data

  end
end
