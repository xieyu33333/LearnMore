class Admin::BlogsController < Admin::BaseController
  skip_before_filter:admin? , only: [:change_theme_order, :change_item_order]
  before_filter:mumber? , only: [:change_theme_order, :change_item_order]
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
    @blog = Blog.where(:section_id => params[:section]).order("sort")
    @blog_classify = @blog.pluck(:blogtype).uniq
  end

  def change_theme_order
    @blog = Blog.where(:section_id => params[:section])
    @blog.where(:blogtype => params[:classify]).each do |blog|
      blog.update_attribute(:sort , blog.sort-blog.sort/1000*1000+params[:big_value].to_i*1000)
    end
    redirect_to :back
  end

  def change_item_order
    @blog = Blog.find(params[:id])
    @blog.update_attribute(:sort , params[:small_value].to_i+@blog.sort.to_s.reverse.sub(/\d{3}/,"000").reverse.to_i)
    redirect_to :back
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

end
