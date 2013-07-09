class Download < ActiveRecord::Base
  attr_accessible :studyfile_id, :user_id
  belongs_to :user
  belongs_to :studyfile
end
