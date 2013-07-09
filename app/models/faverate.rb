class Faverate < ActiveRecord::Base
  attr_accessible :blog_id, :studyfile_id, :user_id
  belongs_to :user
  belongs_to :studyfile
  belongs_to :blog
end
