#encoding: utf-8
module ApplicationHelper
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

  def blog_type2name(type)
    if type == 0
      "视角"
    elsif type == 1
      "辟谣"
    elsif type == 2
      "观点"
    elsif type == 3
      "书评与影评"    
    end
  end

end
