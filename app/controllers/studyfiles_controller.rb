class StudyfilesController < ApplicationController
  # GET /studyfiles
  # GET /studyfiles.json
  def index
    @studyfiles = Studyfile.page params[:page]
  end

  # GET /studyfiles/1
  # GET /studyfiles/1.json
  def show
    @studyfile = Studyfile.find(params[:id])
  end

  # GET /studyfiles/new
  # GET /studyfiles/new.json
  def new
    @studyfile = Studyfile.new
  end

  # GET /studyfiles/1/edit
  def edit
    @studyfile = Studyfile.find(params[:id])
  end

  # POST /studyfiles
  # POST /studyfiles.json
  def create
    @studyfile = Studyfile.new(params[:studyfile])
    @studyfile.user_id = current_user.id
    if @studyfile.save
      redirect_to @studyfile, notice: 'Studyfile was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /studyfiles/1
  # PUT /studyfiles/1.json
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

  # DELETE /studyfiles/1
  # DELETE /studyfiles/1.json
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
