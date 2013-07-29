class Admin::CommentsController < Admin::BaseController
  def index
    @comments = Comment.page params[:page]
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url
  end
end
