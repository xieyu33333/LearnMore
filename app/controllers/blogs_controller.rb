class BlogsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :destroy, :edit, :index]
  before_filter :author?, only: [:destroy, :edit]
  before_filter :mumber?, only: [:new, :create, :index]
  layout "application", only: [:index, :new, :order]
  def index
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
  end

  def new
    @blog = Blog.new
    @type_arr = Blog.where(:section_id => params[:section_id]).pluck(:blogtype).uniq.map{|type| [type, type]}
  end

  def edit
    @blog = Blog.find(params[:id])
    @type_arr = Blog.where(:section_id => params[:section_id]).pluck(:blogtype).uniq.map{|type| [type, type]}
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

  def mumber?
    if params[:section_id]
      @section = Section.find(params[:section_id])
      if current_user.admin? || @section.users.pluck(:id).index(current_user.id)
        true
      else
        render 'homes/show_503'
      end
    else
      true
    end
  end

  def order
    @blog = Blog.where(:section_id => params[:section_id]).order("sort")
    @blog_classify = @blog.pluck(:blogtype).uniq
  end

end
