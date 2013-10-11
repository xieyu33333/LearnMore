class Admin::StudyfilesController < Admin::BaseController
  def index
    @studyfiles = Studyfile.page params[:page]
  end
    
  def destroy
    @studyfile = Studyfile.find(params[:id])
    file = Rails.public_path + @studyfile.file_url.to_s
    File.delete(file) if File.exist?(file) && !File.directory?(file)
    @studyfile.destroy
    redirect_to :back
  end

  def order
    @file = Studyfile.where(:section_id => params[:section]).order("sort")
    @file_classify = @file.pluck(:filetype).uniq
  end

  def change_theme_order
    @file = Studyfile.where(:section_id => params[:section])
    @file.where(:filetype => params[:classify]).each do |file|
      file.update_attribute(:sort , file.sort-file.sort/1000*1000+params[:big_value].to_i*1000)
    end
    redirect_to :back
  end

  def change_item_order
    @file = Studyfile.find(params[:id])
    @file.update_attribute(:sort , params[:small_value].to_i+@file.sort.to_s.reverse.sub(/\d{3}/,"000").reverse.to_i)
    redirect_to :back
  end
end
