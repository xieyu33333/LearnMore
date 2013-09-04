class Admin::SectionsController < Admin::BaseController
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.new(params[:section])
    if !params[:sectionLogo].nil?
      @section.add_picture(params[:sectionLogo])
    end
    if !params[:users].nil? && params[:users].any?
      @section.update_users(params[:users])
    end
    if @section.save
      redirect_to @section, notice: 'Section was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @section = Section.find(params[:id])
    @section.update_attributes(params[:section])
    if !params[:sectionLogo].nil?
      @section.add_picture(params[:sectionLogo])
    end
    if !params[:users].nil? && params[:users].any?
      @section.update_users(params[:users])
    end
    if @section.save
      redirect_to [:admin, @section], notice: 'Section was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to :back
  end

  def pass
    @section = Section.find(params[:id])
    @section.update_attribute(:status, 0)
    redirect_to :back
  end

  def unpass
    @section = Section.find(params[:id])
    @section.update_attribute(:status, 1)
    redirect_to :back
  end
end
