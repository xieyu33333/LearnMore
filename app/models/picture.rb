class Picture < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :name
  belongs_to :imageable , :polymorphic => true
  mount_uploader :name, PictureUploader
  
  def image_url
    "#{self.name}"
  end
end