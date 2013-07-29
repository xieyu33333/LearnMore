class Admin::TopicsController < Admin::BaseController
  def index
    @topics = Topic.all
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_url
  end
end
