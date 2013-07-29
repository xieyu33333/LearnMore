class Admin::ForumsController < Admin::BaseController
  def index
    @forums = Forum.all
  end

  def show
    @forum = Forum.find(params[:id])
  end

  def new
    @forum = Forum.new
  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def create
    @forum = Forum.new(params[:forum])
    if @forum.save
      redirect_to @forum, notice: 'Forum was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @forum = Forum.find(params[:id])
    if @forum.update_attributes(params[:forum])
      redirect_to @forum, notice: 'Forum was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    redirect_to forums_url
  end
end
