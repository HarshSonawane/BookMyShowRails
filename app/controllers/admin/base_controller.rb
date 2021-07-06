class Admin::BaseController < ApplicationController
  before_action :restrict_user_by_role

  protected

  def restrict_user_by_role
    unless current_user or current_user.role == "admin"
      redirect_to root_path
    end
  end

end