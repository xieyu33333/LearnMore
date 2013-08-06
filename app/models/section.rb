class Section < ActiveRecord::Base
  attr_accessible :name, :description, :picture_id
  has_many :users
  has_many :blogs
  has_many :studyfiles
  has_one :picture, as: :imageable

  def add_picture(pictures)
    pictures.each do |pic|
      picture = Picture.new
      picture.name = pic
      picture.save!
      self.picture = picture
    end
  end
end
