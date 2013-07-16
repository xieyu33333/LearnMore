class Forum < ActiveRecord::Base
  attr_accessible :description, :name, :parent_id, :rule, :urlname
  has_many :topic
end
