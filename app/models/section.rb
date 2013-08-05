class Section < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :users
  has_many :blogs
  has_many :studyfiles
  has_one :picture, as: :imageable
end
