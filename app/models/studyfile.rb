class Studyfile < ActiveRecord::Base
  attr_accessible :file_url, :filename, :filetype, :point
  mount_uploader :file_url, DatafileUploader
  belongs_to :user
end