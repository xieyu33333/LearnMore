class HomesController < ApplicationController
  def index
  	@file_classify = Studyfile.section(1).uniq!
  	@blog_classify = Blog.section(1).uniq!
  	@blog = Blog.section(1).all
  	@file = Studyfile.section(1).all
    @body_id = "home"
  end

  def all_data

  end
end
