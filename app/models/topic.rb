class Topic < ActiveRecord::Base
  attr_accessible :content, :digg, :forum_id, :name, :status, :user_id
  belongs_to :user
  belongs_to :forum
  has_many :faverate
end
