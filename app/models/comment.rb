#encoding: utf-8
class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  attr_accessible :comment, :user_id

  belongs_to :commentable, :polymorphic => true
  
  default_scope :order => 'created_at ASC'
  acts_as_cached

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
  after_create :comment_message

  def comment_message
    if self.commentable_type == "Blog"
      blog = Blog.find(self.commentable_id)
      blog.user.message.create(:content => "你的文章:#{blog.title}有了新回复", :link => "/blogs/#{blog.id}")
    else
      return false  
    end
  end
end
