# encoding: utf-8
module StudyfilesHelper

  def image?
    self.file_url.match(/jpg/ || /png/)
  end
end
