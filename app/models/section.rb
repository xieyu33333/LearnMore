#encoding: utf-8
class Section < ActiveRecord::Base
  attr_accessible :name, :description, :picture_id
  has_and_belongs_to_many :users
  has_many :blogs
  has_many :studyfiles
  has_one :picture, as: :imageable
  validates :name, :description, :presence=>true
  after_create :section_message

  def add_picture(pictures)
    pictures.each do |pic|
      picture = Picture.new
      picture.name = pic
      picture.save!
      self.picture = picture
    end
  end

  def add_users(users)
    users.each do |username|
      user = User.find_by_username(username)
      if !user.nil?
        self.users << user
      end
    end
  end

  def update_users(updated_users_array)
    self.users.each do |user|
      unless updated_users_array.include?(user.username)
        self.users.delete(user)
      end
    end
    updated_users_array.each do |username|
      user = User.find_by_username(username)
      if !self.users.exists?(user) && !user.nil?
        self.users << user
      end
    end
  end

  def pass?
    status == 0
  end

  def section_message
    User.where(:admin => 1).each do |admin|
      admin.message.create(:content => "新增版块： #{self.name}", :link => "/sections/#{self.id}")
    end
  end
end
