class Blog < ActiveRecord::Base
  attr_accessible :artical, :title, :user_id, :blogtype, :hit, :comment

  belongs_to :user
  has_many :faverates

  acts_as_commentable
end
