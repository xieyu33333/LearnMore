class Blog < ActiveRecord::Base
  attr_accessible :artical, :title, :user_id
  belongs_to :user
end
