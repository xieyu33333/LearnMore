class BlogsController < ApplicationController

  def index
    @blogs = Blog.page params[:page]

    respond_to do |format|
      format.html
      format.json { render json: @blogs }
    end
  end

  def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @blog }
    end
  end

  def new
    @blog = Blog.new

    respond_to do |format|
      format.html
      format.json { render json: @blog }
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params[:blog])
    @blog.user_id = current_user.id

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end
end
