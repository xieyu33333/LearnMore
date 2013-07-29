class Blog < ActiveRecord::Base
  attr_accessible :artical, :title, :user_id, :blogtype, :hit, :comment

  belongs_to :user
  has_many :faverates

  acts_as_commentable
  acts_as_cached

  def scored
    score = self.hit
    $redis.zadd("hit", score, self.id)
  end

  def rank_by_hit
    $redis.zrevrank("hit", self.id) + 1
  end
end
