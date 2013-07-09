class StudyfilesController < ApplicationController
  # GET /studyfiles
  # GET /studyfiles.json
  def index
    @studyfiles = Studyfile.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @studyfiles }
    end
  end

  # GET /studyfiles/1
  # GET /studyfiles/1.json
  def show
    @studyfile = Studyfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @studyfile }
    end
  end

  # GET /studyfiles/new
  # GET /studyfiles/new.json
  def new
    @studyfile = Studyfile.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @studyfile }
    end
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

    respond_to do |format|
      if @studyfile.save
        format.html { redirect_to @studyfile, notice: 'Studyfile was successfully created.' }
        format.json { render json: @studyfile, status: :created, location: @studyfile }
      else
        format.html { render action: "new" }
        format.json { render json: @studyfile.errors, status: :unprocessable_entity }
      end
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

    respond_to do |format|
      format.html { redirect_to studyfiles_url }
      format.json { head :no_content }
    end
  end
end
