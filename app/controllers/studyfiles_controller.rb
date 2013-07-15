class StudyfilesController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :destroy]

  def index
    @studyfiles = Studyfile.page params[:page]
  end

  def show
    @studyfile = Studyfile.find(params[:id])
  end

  def new
    @studyfile = Studyfile.new
  end

  def edit
    @studyfile = Studyfile.find(params[:id])
  end

  def create
    @studyfile = Studyfile.new(params[:studyfile])
    @studyfile.user_id = current_user.id
    if @studyfile.save
      redirect_to @studyfile, notice: 'Studyfile was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @studyfile = Studyfile.find(params[:id])

    respond_to do |format|
      if @studyfile.update_attributes(params[:studyfile])
        format.html { redirect_to @studyfile, notice: 'Studyfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @studyfile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @studyfile = Studyfile.find(params[:id])
    file = Rails.public_path + @studyfile.file_url.to_s
    File.delete(file) if File.exist?(file)
    @studyfile.destroy
    redirect_to studyfiles_url
  end

  def download
    @studyfile = Studyfile.find(params[:id])
    send_file Rails.public_path+@studyfile.file_url.to_s,
              filename: "#{@studyfile.filename}"
  end
end
