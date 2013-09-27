class MessagesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @messages = current_user.message
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to :back
  end

  def delete_all
    @messages = Message.where(:user_id => current_user.id)
    @messages.delete_all
    redirect_to :back
  end
end