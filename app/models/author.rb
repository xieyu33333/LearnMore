class Author < ActiveRecord::Base
  attr_accessible :section_id, :user_id, :content
  belongs_to :user
  belongs_to :section
end
