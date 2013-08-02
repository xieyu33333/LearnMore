#encoding: utf-8
class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter:authenticate_user!
  before_filter:admin?

  def admin?
    redirect_to new_user_session_path unless current_user.admin?
    flash[:error] = "权限不足"
  end
end