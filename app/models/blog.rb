class Blog < ActiveRecord::Base
  attr_accessible :artical, :title, :user_id, :blogtype, :hit, :comment, :section_id, :status, :editer

  belongs_to :user
  belongs_to :section
  has_many :faverates
  
  validates :artical, :title, :presence => true

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
