class FaveratesController < ApplicationController
	def create
		@faverate = Faverate.create(:user_id => current_user.id, :studyfile_id => params[:studyfile], :blog_id => params[:blog])
    @faverate.save
    respond_to do |format|
      format.js { render :layout => false }
      format.json { render :json => false}
    end
	end

  def destroy
    @faverate = Faverate.where(:user_id => current_user.id, :blog_id => params[:blog]).first
    @faverate.destroy
    respond_to do |format|
      format.js { render :layout => false }
      format.json { render :json => false}
    end
  end
end