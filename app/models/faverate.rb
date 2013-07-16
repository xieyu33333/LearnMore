class Faverate < ActiveRecord::Base
  attr_accessible :blog_id, :studyfile_id, :user_id
  belongs_to :user
  belongs_to :studyfile, :counter_cache => true
  belongs_to :blog, :counter_cache => true
  belongs_to :topic, :counter_cache => true
end
