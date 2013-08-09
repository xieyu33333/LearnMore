class Studyfile < ActiveRecord::Base
  attr_accessible :file_url, :filename, :filetype, :point, :section_id, :outsite, :description
  mount_uploader :file_url, DatafileUploader
  belongs_to :user
  has_many :faverates
  belongs_to :user
end
