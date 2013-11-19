class SectionsController < ApplicationController
  layout "application", only: [:index]
  before_filter:authenticate_user!, only: [:create, :ask_for_section]
  def index
    @sections = Section.includes(:picture).where(:status => 0)
  end

  def show
    fresh_when(:last_modified => Blog.last.created_at, :etag => Blog.last)
    @body_id = 'home'
    @section = Section.find(params[:id])
    @file_classify = @section.studyfiles.order(:sort).pluck(:filetype).uniq
    @blog_classify = @section.blogs.order(:sort).pluck(:blogtype).uniq
    @blog = @section.blogs.order(:sort)
    @file = @section.studyfiles.order(:sort)
    @user = @section.users.pluck(:id)
  end

  def ask_for_section
    @section = Section.new
  end

  def create
    @section = Section.new(params[:section])
    if !params[:sectionLogo].nil?
      @section.add_picture(params[:sectionLogo])
    end
    if !params[:users].nil? && params[:users].any?
      @section.update_users(params[:users])
    end
      @section.status = 1
    if @section.save
      render '/homes/show_waiting_pass'
    else
      render action: "new"
    end
  end
end

