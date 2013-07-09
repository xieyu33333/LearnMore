# encoding: utf-8
module StudyfilesHelper
	def file_type2name(type)
    if type == 0
      "分类1"
    elsif type == 1
      "分类2"
    elsif type == 2
      "分类3"
    elsif type == 3
      "分类4"    
    end
  end

  def image?
    self.file_url.match(/jpg/ || /png/)
  end
end
