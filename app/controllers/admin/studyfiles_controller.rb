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
end
