class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    redirect_to :back
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to :back, notice: 'comment was successfully created.'
    else
      render action: "new"
    end
  end

  def create_blog_comment
  	@blog = Blog.find(params[:id])
    @comment = @blog.comments.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to :back, notice: 'comment was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @comment, notice: 'Blog was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url
  end
end
