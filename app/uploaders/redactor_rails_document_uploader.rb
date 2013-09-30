# encoding: utf-8
class RedactorRailsDocumentUploader < CarrierWave::Uploader::Base
  include RedactorRails::Backend::CarrierWave

  # storage :fog
  storage :qiniu

  def store_dir
  end

  def extension_white_list
    RedactorRails.document_file_types
  end
end
