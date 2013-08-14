class Admin::BlogsController < Admin::BaseController
  def index
    @blogs = Blog.page params[:page]
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to '/admin/blogs'
  end

  def edit
    @blog = Blog.find(params[:id])
  end


  def order
    @blog = Blog.where(:section_id => 1).order("sort")
    @blog_classify = @blog.pluck(:blogtype).uniq
  end
end
