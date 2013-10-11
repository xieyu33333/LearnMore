class StudyfilesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :destroy, :edit, :index]
  before_filter :author?, only: [:destroy, :edit]
  before_filter :mumber?, only: [:new, :create, :index]
  def index
    @studyfiles = Studyfile.find_all_by_section_id(params[:section_id])
  end
  def show
    @studyfile = Studyfile.find(params[:id])
  end

  def new
    @studyfile = Studyfile.new
    @type_arr = Studyfile.where(:section_id => params[:section_id]).pluck(:filetype).uniq.map{|type| [type, type]}
  end

  def edit
    @studyfile = Studyfile.find(params[:id])
    @type_arr = Studyfile.where(:section_id => params[:section_id]).pluck(:filetype).uniq.map{|type| [type, type]}
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
    File.delete(file) if File.exist?(file) && !File.directory?(file)
    @studyfile.destroy
    redirect_to :back
  end

  def download
    @studyfile = Studyfile.find(params[:id])
    # open("#{@studyfile.filename}", 'wb') do |file|
    #   file << open(@studyfile.file_url.to_s).read
    # end
    send_data open(@studyfile.file_url.to_s),
              filename: "#{@studyfile.filename}"
  end

  def author?
    @studyfile = Studyfile.find(params[:id])
    if current_user != @studyfile.user
      render 'homes/show_503'
    end
  end

  def mumber?
    if params[:section_id]
      @section = Section.find(params[:section_id])
      if current_user.admin? || @section.users.pluck(:id).index(current_user.id)
        true
      else
        render 'homes/show_503'
      end
    else
      true
    end
  end

  def order
    @file = Studyfile.where(:section_id => params[:section_id]).order("sort")
    @file_classify = @file.pluck(:filetype).uniq
  end

  def classify
    @file = Studyfile.where(:section_id => params[:section_id]).order("sort")
    @file_classify = @file.pluck(:filetype).uniq
  end

  def change_classify
    @file = Studyfile.where(:section_id => params[:section])
    @file.where(:filetype => params[:old_classify]).each do |file|
      file.update_attribute(:filetype , params[:classify])
    end
    redirect_to :back
  end
end
