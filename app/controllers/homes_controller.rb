class HomesController < ApplicationController
  def index
  	@file_classify = [0,1,2,3]
  	@blog_classify = [0,1,2,3]
  	render :layout => false
  end

  def rank

  	#@blog_rank = $redis.zrevrank("highscores", self.id) + 1
  end
end
