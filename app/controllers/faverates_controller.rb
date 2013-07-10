class FaveratesController < ApplicationController
	def create
		@faverate = Faverate.create(:user_id => current_user.id, :studyfile_id => params[:studyfile])
    @faverate.save
    redirect_to :back
	end

  def destroy
    @faverate = Faverate.where(:user_id => current_user.id, :studyfile_id => params[:studyfile]).first
    @faverate.destroy
    redirect_to :back
  end
end