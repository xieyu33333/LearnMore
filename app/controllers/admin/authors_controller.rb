#encoding: utf-8
class Admin::AuthorsController < Admin::BaseController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def pass
    @author = Author.find(params[:id])
    if SectionsUser.where(:user_id => @author.user_id, :section_id => @author.section_id)==[]
      SectionsUser.create(:user_id => @author.user_id, :section_id => @author.section_id)
    end
    @author.destroy
    redirect_to admin_authors_url
  end

  def create
    @author = Author.new(params[:author])
    if @author.save
      redirect_to @author, notice: '申请提交成功.'
    else
      render action: "new"
      flash[:error] = "申请提交失败"
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_url
  end
end
