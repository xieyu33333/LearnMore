class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def show
    @body_id = 'home'
    @section = Section.find(params[:id])
    @file_classify = @section.studyfiles.pluck(:filetype).uniq
    @blog_classify = @section.blogs.pluck(:blogtype).uniq
    @blog = @section.blogs
    @file = @section.studyfiles
    @user = @section.users.pluck(:id)
  end
end
