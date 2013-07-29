class BlogsController < ApplicationController

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
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params[:blog])
    @blog.user_id = current_user.id
    @blog.scored
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
end
