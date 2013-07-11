class Blog < ActiveRecord::Base
  attr_accessible :artical, :title, :user_id, :blogtype, :hit
  belongs_to :user
  has_many :faverates

  acts_as_commentable
end
