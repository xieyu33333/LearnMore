class Message < ActiveRecord::Base
  attr_accessible :content, :link
  belongs_to :user
end
