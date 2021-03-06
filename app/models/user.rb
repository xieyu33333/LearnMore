#encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  has_many :blog
  has_many :studyfile
  has_many :download
  has_many :faverate
  has_many :comment
  has_many :topic
  has_many :message
  belongs_to :user
  has_and_belongs_to_many :sections
  after_create :push_message
  validates :username, :uniqueness=>true
  validates :username, :presence=>true

  attr_accessor :login
  # attr_accessible :title, :body
  def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    where(conditions).first
	  end
  end

  def add_picture(pictures)
    pictures.each do |pic|
      picture = Picture.new
      picture.name = pic
      picture.save!
      self.picture = picture
    end
  end

  def push_message
    User.where(:admin => 1).each do |admin|
      admin.message.create(:content => "新增用户： #{self.username}", :link => "/users/#{self.id}")
    end
  end
  
end
