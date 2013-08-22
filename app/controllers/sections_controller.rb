class SectionsController < ApplicationController
  layout "application", only: [:index]
  def index
    @sections = Section.all
  end

  def show
    @body_id = 'home'
    @section = Section.find(params[:id])
    @file_classify = @section.studyfiles.pluck(:filetype).uniq
    @blog_classify = @section.blogs.order(:sort).pluck(:blogtype).uniq
    @blog = @section.blogs.order(:sort)
    @file = @section.studyfiles
    @user = @section.users.pluck(:id)
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to :back
  end
end

