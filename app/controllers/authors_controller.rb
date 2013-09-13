#encoding: utf-8
class AuthorsController < ApplicationController
  # def index
  #   @authors = Author.all
  # end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  # def pass
  #   @author = Author.find(params[:id])
  #   @section = Section.find(@author.section_id)
  #   @section.add_users(@author.user.username)
  # end

  def create
    @author = Author.new(params[:author])
    if @author.save
      redirect_to @author, notice: '申请提交成功.'
    else
      render action: "new"
      flash[:error] = "申请提交失败"
    end
  end

  # def destroy
  #   @author = Author.find(params[:id])
  #   @author.destroy
  #   redirect_to authors_url
  # end
end
