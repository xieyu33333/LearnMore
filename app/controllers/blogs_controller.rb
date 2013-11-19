class BlogsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :destroy, :edit, :index]
  before_filter :author?, only: [:destroy]
  before_filter :mumber?, only: [:edit]
  before_filter :section_mumber?, only: [:index, :new, :create]
  layout "application", only: [:index, :order, :classify]
  def index
    fresh_when(:last_modified => Blog.last.created_at, :etag => Blog.last)
    @blogs = Blog.find_all_by_section_id(params[:section_id])
  end

  def show
    @blog = Blog.find(params[:id])
    @blog.increment!(:hit)
    gon.blog_id = @blog.id
    if current_user && Faverate.where(:user_id => current_user.id, :blog_id => @blog.id).first
      @faverate = Faverate.where(:user_id => current_user.id, :blog_id => @blog.id).first.id
    else
      @faverate = nil
    end
    gon.watch.faverate_id = @faverate
    @comments = @blog.comments
    if @blog.section
      @user = @blog.section.users.pluck(:id)
    else 
      @user = []
    end
  end

  def new
    @blog = Blog.new
    @type_arr = Blog.where(:section_id => params[:section_id]).pluck(:blogtype).uniq.map{|type| [type, type]}
  end

  def edit
    @blog = Blog.find(params[:id])
    render 'begin_edit' and return if @blog.status != 1    
    render 'homes/show_editing' and return if @blog.editer != current_user.id && @blog.status = 1
    render 'edit' if current_user.admin? || @blog.editer = current_user.id && @blog.status = 1 
  end

  def editing
    user = current_user.id
    @blog = Blog.find(params[:id])
    @blog.update_attribute(:status, 1)
    @blog.update_attribute(:editer, user)
    redirect_to edit_blog_url
  end

  def no_editing
    @blog = Blog.find(params[:id])
    @blog.update_attribute(:status, 0)
    @blog.update_attribute(:editer, 0)
    redirect_to edit_blog_url
  end

  def create
    @blog = Blog.new(params[:blog])
    @blog.user_id = current_user.id
    @blog.scored
    @type_arr = Blog.where(:section_id => params[:section_id]).pluck(:blogtype).uniq.map{|type| [type, type]}
    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_url
  end

  def author?
    @blog = Blog.find(params[:id])
    if current_user != @blog.user
      render 'homes/show_503'
    end
  end

  def section_mumber?
    if params[:section_id]
      @section = Section.find(params[:section_id])
      if current_user.admin? || @section.users.pluck(:id).index(current_user.id)
        true
      else
        render 'homes/show_503'
      end
    end
  end

  def mumber?
    @blog = Blog.find(params[:id])
    @section = @blog.section
    if current_user.admin? || @section.users.pluck(:id).index(current_user.id)
      true
    else
      render 'homes/show_503'
    end
  end

  def order
    @blog = Blog.where(:section_id => params[:section_id]).order("sort")
    @blog_classify = @blog.pluck(:blogtype).uniq
  end

  def classify
    @blog = Blog.where(:section_id => params[:section_id]).order("sort")
    @blog_classify = @blog.pluck(:blogtype).uniq
  end

  def change_classify
    @blog = Blog.where(:section_id => params[:section])
    @blog.where(:blogtype => params[:old_classify]).each do |blog|
      blog.update_attribute(:blogtype , params[:classify])
    end
    redirect_to :back
  end

end
